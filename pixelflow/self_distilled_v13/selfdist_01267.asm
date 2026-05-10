; DESCRIPTION: Renders a magenta line segment connecting (96, 83) to (398, 116).
; PLAN: r0=96(x1), r1=83(y1), r2=398(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 83
LDI r2, 398
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
