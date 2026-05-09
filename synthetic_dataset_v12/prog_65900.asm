; DESCRIPTION: Places a purple line segment connecting (394, 154) to (367, 22).
; PLAN: r0=394(x1), r1=154(y1), r2=367(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 154
LDI r2, 367
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
