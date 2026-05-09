; DESCRIPTION: Draws a blue line from (112, 171) to (380, 166).
; PLAN: r0=112(x1), r1=171(y1), r2=380(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 171
LDI r2, 380
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
