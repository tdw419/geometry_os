; DESCRIPTION: Places a cyan line segment connecting (234, 76) to (178, 18).
; PLAN: r0=234(x1), r1=76(y1), r2=178(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 76
LDI r2, 178
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
