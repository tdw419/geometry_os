; DESCRIPTION: Places a cyan line segment connecting (71, 28) to (244, 26).
; PLAN: r0=71(x1), r1=28(y1), r2=244(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 28
LDI r2, 244
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
