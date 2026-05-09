; DESCRIPTION: Draws a blue line from (26, 25) to (92, 173).
; PLAN: r0=26(x1), r1=25(y1), r2=92(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 25
LDI r2, 92
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
