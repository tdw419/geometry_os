; DESCRIPTION: Draws a magenta line from (396, 94) to (282, 242).
; PLAN: r0=396(x1), r1=94(y1), r2=282(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 94
LDI r2, 282
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
