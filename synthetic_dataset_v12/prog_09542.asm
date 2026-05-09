; DESCRIPTION: Places a cyan line segment connecting (336, 14) to (319, 248).
; PLAN: r0=336(x1), r1=14(y1), r2=319(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 14
LDI r2, 319
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
