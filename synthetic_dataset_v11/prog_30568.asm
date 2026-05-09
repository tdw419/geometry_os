; DESCRIPTION: Places a red line segment connecting (135, 188) to (111, 57).
; PLAN: r0=135(x1), r1=188(y1), r2=111(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 188
LDI r2, 111
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
