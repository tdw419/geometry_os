; DESCRIPTION: Places a cyan line segment connecting (115, 9) to (234, 195).
; PLAN: r0=115(x1), r1=9(y1), r2=234(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 9
LDI r2, 234
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
