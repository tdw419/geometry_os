; DESCRIPTION: Draws a red line from (52, 64) to (58, 108).
; PLAN: r0=52(x1), r1=64(y1), r2=58(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 64
LDI r2, 58
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
