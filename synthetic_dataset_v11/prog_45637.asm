; DESCRIPTION: Places a green line segment connecting (95, 138) to (195, 234).
; PLAN: r0=95(x1), r1=138(y1), r2=195(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 138
LDI r2, 195
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
