; DESCRIPTION: Places a cyan line segment connecting (148, 192) to (441, 121).
; PLAN: r0=148(x1), r1=192(y1), r2=441(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 192
LDI r2, 441
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
