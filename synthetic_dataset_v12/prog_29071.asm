; DESCRIPTION: Draws a magenta line from (128, 36) to (75, 209).
; PLAN: r0=128(x1), r1=36(y1), r2=75(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 36
LDI r2, 75
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
