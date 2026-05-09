; DESCRIPTION: Draws a magenta line from (95, 96) to (493, 63).
; PLAN: r0=95(x1), r1=96(y1), r2=493(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 96
LDI r2, 493
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
