; DESCRIPTION: Draws a purple line from (32, 130) to (290, 164).
; PLAN: r0=32(x1), r1=130(y1), r2=290(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 130
LDI r2, 290
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
