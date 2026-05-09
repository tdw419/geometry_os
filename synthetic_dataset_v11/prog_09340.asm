; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (102, 128) with radius 38. Then Draws a magenta line from (186, 211) to (118, 104).
; PLAN: r0=102(x), r1=128(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=186(x1), r1=211(y1), r2=118(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (102, 128) with radius 38.
; PLAN: r0=102(x), r1=128(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 128
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta line from (186, 211) to (118, 104).
; PLAN: r0=186(x1), r1=211(y1), r2=118(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 211
LDI r2, 118
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
