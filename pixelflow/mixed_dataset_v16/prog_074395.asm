; DESCRIPTION: Draws a magenta line from (493, 253) to (292, 21).
; PLAN: r0=493(x1), r1=253(y1), r2=292(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 253
LDI r2, 292
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
