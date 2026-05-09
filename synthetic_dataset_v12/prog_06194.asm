; DESCRIPTION: Draws a white line from (421, 244) to (139, 156).
; PLAN: r0=421(x1), r1=244(y1), r2=139(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 244
LDI r2, 139
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
