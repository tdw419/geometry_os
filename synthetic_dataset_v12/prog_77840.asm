; DESCRIPTION: Draws a red line from (40, 48) to (63, 163).
; PLAN: r0=40(x1), r1=48(y1), r2=63(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 48
LDI r2, 63
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
