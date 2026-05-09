; DESCRIPTION: Places a cyan line segment connecting (134, 99) to (256, 76).
; PLAN: r0=134(x1), r1=99(y1), r2=256(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 99
LDI r2, 256
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
