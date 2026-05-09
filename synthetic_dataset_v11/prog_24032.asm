; DESCRIPTION: Draws a green line from (236, 246) to (48, 101).
; PLAN: r0=236(x1), r1=246(y1), r2=48(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 246
LDI r2, 48
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
