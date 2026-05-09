; DESCRIPTION: Places a cyan line segment connecting (232, 235) to (76, 61).
; PLAN: r0=232(x1), r1=235(y1), r2=76(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 235
LDI r2, 76
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
