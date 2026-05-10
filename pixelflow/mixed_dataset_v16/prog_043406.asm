; DESCRIPTION: Draws a red line from (63, 14) to (84, 173).
; PLAN: r0=63(x1), r1=14(y1), r2=84(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 14
LDI r2, 84
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
