; DESCRIPTION: Renders a blue line between points (187, 68) and (497, 209).
; PLAN: r0=187(x1), r1=68(y1), r2=497(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 68
LDI r2, 497
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
