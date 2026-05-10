; DESCRIPTION: Renders a red line segment connecting (243, 15) to (269, 5).
; PLAN: r0=243(x1), r1=15(y1), r2=269(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 15
LDI r2, 269
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
