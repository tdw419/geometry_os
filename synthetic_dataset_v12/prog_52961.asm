; DESCRIPTION: Places a cyan line segment connecting (351, 255) to (442, 95).
; PLAN: r0=351(x1), r1=255(y1), r2=442(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 255
LDI r2, 442
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
