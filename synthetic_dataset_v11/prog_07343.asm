; DESCRIPTION: Places a red line segment connecting (98, 111) to (86, 66).
; PLAN: r0=98(x1), r1=111(y1), r2=86(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 111
LDI r2, 86
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
