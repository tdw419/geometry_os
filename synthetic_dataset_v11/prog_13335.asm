; DESCRIPTION: Places a cyan line segment connecting (163, 178) to (43, 39).
; PLAN: r0=163(x1), r1=178(y1), r2=43(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 178
LDI r2, 43
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
