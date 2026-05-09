; DESCRIPTION: Composite: . Then Draws a purple line from (179, 228) to (243, 138). Then Draws a orange circle centered at (69, 99) with radius 32.
; PLAN: r0=179(x1), r1=228(y1), r2=243(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=69(x), r1=99(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (179, 228) to (243, 138).
; PLAN: r0=179(x1), r1=228(y1), r2=243(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 228
LDI r2, 243
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (69, 99) with radius 32.
; PLAN: r0=69(x), r1=99(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 99
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
