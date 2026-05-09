; DESCRIPTION: Draws a magenta line from (43, 86) to (70, 128).
; PLAN: r0=43(x1), r1=86(y1), r2=70(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 86
LDI r2, 70
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
