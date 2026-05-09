; DESCRIPTION: Places a white line segment connecting (249, 199) to (157, 29).
; PLAN: r0=249(x1), r1=199(y1), r2=157(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 199
LDI r2, 157
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
