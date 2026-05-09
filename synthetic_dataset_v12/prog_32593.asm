; DESCRIPTION: Places a cyan line segment connecting (67, 143) to (411, 79).
; PLAN: r0=67(x1), r1=143(y1), r2=411(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 143
LDI r2, 411
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
