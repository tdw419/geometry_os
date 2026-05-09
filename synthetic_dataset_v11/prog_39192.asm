; DESCRIPTION: Places a blue line segment connecting (205, 181) to (195, 42).
; PLAN: r0=205(x1), r1=181(y1), r2=195(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 181
LDI r2, 195
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
