; DESCRIPTION: Draws a white line from (491, 141) to (48, 199).
; PLAN: r0=491(x1), r1=141(y1), r2=48(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 141
LDI r2, 48
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
