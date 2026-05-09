; DESCRIPTION: Draws a red line from (147, 81) to (64, 213).
; PLAN: r0=147(x1), r1=81(y1), r2=64(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 81
LDI r2, 64
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
