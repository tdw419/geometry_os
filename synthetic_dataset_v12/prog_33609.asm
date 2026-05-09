; DESCRIPTION: Places a cyan line segment connecting (9, 184) to (351, 184).
; PLAN: r0=9(x1), r1=184(y1), r2=351(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 184
LDI r2, 351
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
