; DESCRIPTION: Draws a magenta line from (494, 136) to (504, 21).
; PLAN: r0=494(x1), r1=136(y1), r2=504(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 136
LDI r2, 504
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
