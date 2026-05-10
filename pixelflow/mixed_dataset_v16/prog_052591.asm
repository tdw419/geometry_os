; DESCRIPTION: Renders a red line segment connecting (283, 189) to (307, 135).
; PLAN: r0=283(x1), r1=189(y1), r2=307(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 189
LDI r2, 307
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
