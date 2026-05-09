; DESCRIPTION: Places a black line segment connecting (90, 130) to (35, 167).
; PLAN: r0=90(x1), r1=130(y1), r2=35(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 130
LDI r2, 35
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
