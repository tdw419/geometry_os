; DESCRIPTION: Places a cyan line segment connecting (185, 164) to (97, 11).
; PLAN: r0=185(x1), r1=164(y1), r2=97(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 164
LDI r2, 97
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
