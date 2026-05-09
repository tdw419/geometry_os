; DESCRIPTION: Places a blue line segment connecting (394, 115) to (195, 29).
; PLAN: r0=394(x1), r1=115(y1), r2=195(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 115
LDI r2, 195
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
