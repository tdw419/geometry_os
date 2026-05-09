; DESCRIPTION: Places a cyan line segment connecting (163, 121) to (157, 14).
; PLAN: r0=163(x1), r1=121(y1), r2=157(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 121
LDI r2, 157
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
