; DESCRIPTION: Places a cyan line segment connecting (13, 193) to (138, 96).
; PLAN: r0=13(x1), r1=193(y1), r2=138(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 193
LDI r2, 138
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
