; DESCRIPTION: Places a cyan line segment connecting (246, 32) to (133, 10).
; PLAN: r0=246(x1), r1=32(y1), r2=133(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 32
LDI r2, 133
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
