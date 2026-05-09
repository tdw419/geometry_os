; DESCRIPTION: Draws a magenta line from (87, 152) to (181, 32).
; PLAN: r0=87(x1), r1=152(y1), r2=181(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 152
LDI r2, 181
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
