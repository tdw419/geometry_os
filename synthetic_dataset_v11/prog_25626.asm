; DESCRIPTION: Draws a black line from (226, 166) to (221, 209).
; PLAN: r0=226(x1), r1=166(y1), r2=221(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 166
LDI r2, 221
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
