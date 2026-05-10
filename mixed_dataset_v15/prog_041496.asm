; DESCRIPTION: Draws a blue line from (167, 165) to (240, 184).
; PLAN: r0=167(x1), r1=165(y1), r2=240(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 165
LDI r2, 240
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
