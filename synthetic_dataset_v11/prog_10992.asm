; DESCRIPTION: Composite: . Then Creates a white circular shape at (182, 172) with radius 50. Then Draws a yellow line from (150, 196) to (11, 99).
; PLAN: r0=182(x), r1=172(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=150(x1), r1=196(y1), r2=11(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white circular shape at (182, 172) with radius 50.
; PLAN: r0=182(x), r1=172(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 172
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (150, 196) to (11, 99).
; PLAN: r0=150(x1), r1=196(y1), r2=11(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 196
LDI r2, 11
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
