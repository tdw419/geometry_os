; DESCRIPTION: Draws a yellow line from (388, 115) to (115, 255).
; PLAN: r0=388(x1), r1=115(y1), r2=115(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 115
LDI r2, 115
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
