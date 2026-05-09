; DESCRIPTION: Draws a blue line from (202, 111) to (41, 240).
; PLAN: r0=202(x1), r1=111(y1), r2=41(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 111
LDI r2, 41
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
