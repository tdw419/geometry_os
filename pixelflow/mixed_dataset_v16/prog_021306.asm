; DESCRIPTION: Draws a blue line from (461, 130) to (64, 33).
; PLAN: r0=461(x1), r1=130(y1), r2=64(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 130
LDI r2, 64
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
