; DESCRIPTION: Places a cyan line segment connecting (174, 155) to (2, 193).
; PLAN: r0=174(x1), r1=155(y1), r2=2(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 155
LDI r2, 2
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
