; DESCRIPTION: Draws a magenta line from (493, 215) to (395, 81).
; PLAN: r0=493(x1), r1=215(y1), r2=395(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 215
LDI r2, 395
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
