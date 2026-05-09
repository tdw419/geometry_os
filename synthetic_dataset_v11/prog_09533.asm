; DESCRIPTION: Draws a magenta line from (188, 98) to (110, 128).
; PLAN: r0=188(x1), r1=98(y1), r2=110(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 98
LDI r2, 110
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
