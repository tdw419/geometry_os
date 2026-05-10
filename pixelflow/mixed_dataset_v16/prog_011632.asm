; DESCRIPTION: Draws a yellow line from (92, 28) to (60, 122).
; PLAN: r0=92(x1), r1=28(y1), r2=60(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 28
LDI r2, 60
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
