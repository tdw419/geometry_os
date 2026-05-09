; DESCRIPTION: Places a cyan line segment connecting (253, 79) to (115, 22).
; PLAN: r0=253(x1), r1=79(y1), r2=115(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 79
LDI r2, 115
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
