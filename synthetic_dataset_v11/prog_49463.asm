; DESCRIPTION: Draws a blue line from (41, 41) to (167, 209).
; PLAN: r0=41(x1), r1=41(y1), r2=167(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 41
LDI r2, 167
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
