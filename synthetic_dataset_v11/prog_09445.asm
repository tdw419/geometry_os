; DESCRIPTION: Places a cyan line segment connecting (72, 61) to (104, 116).
; PLAN: r0=72(x1), r1=61(y1), r2=104(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 61
LDI r2, 104
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
