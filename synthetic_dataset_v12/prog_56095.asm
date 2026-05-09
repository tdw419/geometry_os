; DESCRIPTION: Places a cyan line segment connecting (396, 145) to (469, 248).
; PLAN: r0=396(x1), r1=145(y1), r2=469(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 145
LDI r2, 469
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
