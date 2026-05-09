; DESCRIPTION: Draws a blue line from (231, 63) to (23, 60).
; PLAN: r0=231(x1), r1=63(y1), r2=23(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 63
LDI r2, 23
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
