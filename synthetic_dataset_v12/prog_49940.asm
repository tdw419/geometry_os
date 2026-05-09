; DESCRIPTION: Draws a magenta line from (236, 87) to (32, 128).
; PLAN: r0=236(x1), r1=87(y1), r2=32(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 87
LDI r2, 32
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
