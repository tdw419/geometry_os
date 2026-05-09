; DESCRIPTION: Draws a yellow line from (237, 185) to (92, 226).
; PLAN: r0=237(x1), r1=185(y1), r2=92(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 185
LDI r2, 92
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
