; DESCRIPTION: Draws a magenta line from (309, 240) to (61, 219).
; PLAN: r0=309(x1), r1=240(y1), r2=61(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 240
LDI r2, 61
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
