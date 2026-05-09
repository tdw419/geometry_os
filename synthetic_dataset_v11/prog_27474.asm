; DESCRIPTION: Places a red line segment connecting (35, 130) to (243, 52).
; PLAN: r0=35(x1), r1=130(y1), r2=243(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 130
LDI r2, 243
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
