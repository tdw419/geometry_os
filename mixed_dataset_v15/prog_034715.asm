; DESCRIPTION: Renders a red line segment connecting (275, 127) to (240, 151).
; PLAN: r0=275(x1), r1=127(y1), r2=240(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 127
LDI r2, 240
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
