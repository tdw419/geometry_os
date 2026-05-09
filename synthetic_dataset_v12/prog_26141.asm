; DESCRIPTION: Places a magenta line segment connecting (317, 41) to (494, 186).
; PLAN: r0=317(x1), r1=41(y1), r2=494(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 41
LDI r2, 494
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
