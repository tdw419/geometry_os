; DESCRIPTION: Places a cyan line segment connecting (304, 128) to (374, 62).
; PLAN: r0=304(x1), r1=128(y1), r2=374(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 128
LDI r2, 374
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
