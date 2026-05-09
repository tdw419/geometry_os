; DESCRIPTION: Renders a white line between points (246, 217) and (371, 171).
; PLAN: r0=246(x1), r1=217(y1), r2=371(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 217
LDI r2, 371
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
