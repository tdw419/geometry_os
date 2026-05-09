; DESCRIPTION: Places a green line segment connecting (119, 193) to (177, 167).
; PLAN: r0=119(x1), r1=193(y1), r2=177(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 193
LDI r2, 177
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
