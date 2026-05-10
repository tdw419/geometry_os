; DESCRIPTION: Places a cyan line segment connecting (351, 10) to (39, 14).
; PLAN: r0=351(x1), r1=10(y1), r2=39(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 10
LDI r2, 39
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
