; DESCRIPTION: Draws a yellow line from (53, 36) to (236, 255).
; PLAN: r0=53(x1), r1=36(y1), r2=236(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 36
LDI r2, 236
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
