; DESCRIPTION: Draws a white line from (125, 55) to (233, 209).
; PLAN: r0=125(x1), r1=55(y1), r2=233(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 55
LDI r2, 233
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
