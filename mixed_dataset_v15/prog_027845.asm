; DESCRIPTION: Draws a white line from (408, 172) to (64, 203).
; PLAN: r0=408(x1), r1=172(y1), r2=64(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 172
LDI r2, 64
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
