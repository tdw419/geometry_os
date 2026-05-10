; DESCRIPTION: Places a magenta line segment connecting (481, 63) to (418, 32).
; PLAN: r0=481(x1), r1=63(y1), r2=418(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 63
LDI r2, 418
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
