; DESCRIPTION: Places a cyan line segment connecting (122, 6) to (70, 96).
; PLAN: r0=122(x1), r1=6(y1), r2=70(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 6
LDI r2, 70
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
