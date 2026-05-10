; DESCRIPTION: Renders a red line segment connecting (279, 23) to (243, 36).
; PLAN: r0=279(x1), r1=23(y1), r2=243(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 23
LDI r2, 243
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
