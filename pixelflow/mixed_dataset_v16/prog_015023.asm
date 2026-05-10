; DESCRIPTION: Draws a white line from (246, 44) to (375, 199).
; PLAN: r0=246(x1), r1=44(y1), r2=375(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 44
LDI r2, 375
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
