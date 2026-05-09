; DESCRIPTION: Draws a green line from (92, 226) to (399, 62).
; PLAN: r0=92(x1), r1=226(y1), r2=399(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 226
LDI r2, 399
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
