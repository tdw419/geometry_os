; DESCRIPTION: Places a cyan line segment connecting (68, 89) to (136, 193).
; PLAN: r0=68(x1), r1=89(y1), r2=136(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 89
LDI r2, 136
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
