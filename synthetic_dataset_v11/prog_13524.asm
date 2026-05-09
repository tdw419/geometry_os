; DESCRIPTION: Places a cyan line segment connecting (68, 100) to (86, 225).
; PLAN: r0=68(x1), r1=100(y1), r2=86(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 100
LDI r2, 86
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
