; DESCRIPTION: Places a blue line segment connecting (394, 126) to (12, 106).
; PLAN: r0=394(x1), r1=126(y1), r2=12(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 126
LDI r2, 12
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
