; DESCRIPTION: Places a cyan line segment connecting (320, 110) to (204, 50).
; PLAN: r0=320(x1), r1=110(y1), r2=204(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 110
LDI r2, 204
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
