; DESCRIPTION: Draws a yellow line from (213, 93) to (236, 202).
; PLAN: r0=213(x1), r1=93(y1), r2=236(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 93
LDI r2, 236
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
