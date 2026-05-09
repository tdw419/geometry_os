; DESCRIPTION: Draws a white line from (220, 172) to (232, 209).
; PLAN: r0=220(x1), r1=172(y1), r2=232(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 172
LDI r2, 232
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
