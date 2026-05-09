; DESCRIPTION: Places a cyan line segment connecting (77, 64) to (67, 35).
; PLAN: r0=77(x1), r1=64(y1), r2=67(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 64
LDI r2, 67
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
