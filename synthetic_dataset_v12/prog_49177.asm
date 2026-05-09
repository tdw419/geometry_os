; DESCRIPTION: Places a cyan line segment connecting (198, 249) to (483, 101).
; PLAN: r0=198(x1), r1=249(y1), r2=483(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 249
LDI r2, 483
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
