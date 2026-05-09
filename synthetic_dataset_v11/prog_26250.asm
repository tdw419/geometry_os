; DESCRIPTION: Places a cyan line segment connecting (232, 82) to (97, 19).
; PLAN: r0=232(x1), r1=82(y1), r2=97(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 82
LDI r2, 97
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
