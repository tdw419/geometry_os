; DESCRIPTION: Renders a white line between points (491, 43) and (244, 246).
; PLAN: r0=491(x1), r1=43(y1), r2=244(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 43
LDI r2, 244
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
