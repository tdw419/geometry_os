; DESCRIPTION: Places a blue line segment connecting (486, 247) to (292, 166).
; PLAN: r0=486(x1), r1=247(y1), r2=292(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 247
LDI r2, 292
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
