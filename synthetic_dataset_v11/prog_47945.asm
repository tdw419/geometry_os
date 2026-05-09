; DESCRIPTION: Places a cyan line segment connecting (4, 90) to (134, 122).
; PLAN: r0=4(x1), r1=90(y1), r2=134(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 90
LDI r2, 134
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
