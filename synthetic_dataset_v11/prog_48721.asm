; DESCRIPTION: Draws a white line from (210, 203) to (2, 183).
; PLAN: r0=210(x1), r1=203(y1), r2=2(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 203
LDI r2, 2
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
