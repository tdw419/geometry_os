; DESCRIPTION: Places a cyan line segment connecting (54, 157) to (203, 128).
; PLAN: r0=54(x1), r1=157(y1), r2=203(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 157
LDI r2, 203
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
