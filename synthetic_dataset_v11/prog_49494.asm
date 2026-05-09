; DESCRIPTION: Places a black line segment connecting (246, 125) to (246, 16).
; PLAN: r0=246(x1), r1=125(y1), r2=246(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 125
LDI r2, 246
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
