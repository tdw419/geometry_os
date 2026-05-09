; DESCRIPTION: Draws a white line from (119, 195) to (459, 134).
; PLAN: r0=119(x1), r1=195(y1), r2=459(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 195
LDI r2, 459
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
