; DESCRIPTION: Places a cyan line segment connecting (67, 0) to (172, 128).
; PLAN: r0=67(x1), r1=0(y1), r2=172(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 0
LDI r2, 172
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
