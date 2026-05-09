; DESCRIPTION: Draws a green line from (327, 96) to (337, 116).
; PLAN: r0=327(x1), r1=96(y1), r2=337(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 96
LDI r2, 337
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
