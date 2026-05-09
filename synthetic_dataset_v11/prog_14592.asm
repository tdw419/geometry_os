; DESCRIPTION: Places a magenta line segment connecting (42, 237) to (163, 160).
; PLAN: r0=42(x1), r1=237(y1), r2=163(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 237
LDI r2, 163
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
