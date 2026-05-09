; DESCRIPTION: Places a red line segment connecting (86, 111) to (21, 84).
; PLAN: r0=86(x1), r1=111(y1), r2=21(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 111
LDI r2, 21
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
