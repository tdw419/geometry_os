; DESCRIPTION: Places a cyan line segment connecting (49, 253) to (99, 98).
; PLAN: r0=49(x1), r1=253(y1), r2=99(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 253
LDI r2, 99
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
