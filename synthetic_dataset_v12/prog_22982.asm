; DESCRIPTION: Places a white line segment connecting (109, 226) to (270, 195).
; PLAN: r0=109(x1), r1=226(y1), r2=270(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 226
LDI r2, 270
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
