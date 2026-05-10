; DESCRIPTION: Places a white line segment connecting (101, 195) to (148, 55).
; PLAN: r0=101(x1), r1=195(y1), r2=148(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 195
LDI r2, 148
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
