; DESCRIPTION: Draws a magenta line from (23, 224) to (237, 32).
; PLAN: r0=23(x1), r1=224(y1), r2=237(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 224
LDI r2, 237
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
