; DESCRIPTION: Places a cyan line segment connecting (336, 30) to (203, 168).
; PLAN: r0=336(x1), r1=30(y1), r2=203(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 30
LDI r2, 203
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
