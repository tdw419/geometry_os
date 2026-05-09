; DESCRIPTION: Draws a yellow line from (92, 51) to (178, 59).
; PLAN: r0=92(x1), r1=51(y1), r2=178(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 51
LDI r2, 178
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
