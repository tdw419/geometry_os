; DESCRIPTION: Draws a green line from (476, 138) to (324, 55).
; PLAN: r0=476(x1), r1=138(y1), r2=324(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 138
LDI r2, 324
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
