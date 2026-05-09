; DESCRIPTION: Draws a black line from (59, 183) to (183, 36).
; PLAN: r0=59(x1), r1=183(y1), r2=183(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 183
LDI r2, 183
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
