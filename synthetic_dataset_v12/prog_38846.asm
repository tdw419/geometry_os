; DESCRIPTION: Renders a white line between points (346, 19) and (476, 247).
; PLAN: r0=346(x1), r1=19(y1), r2=476(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 19
LDI r2, 476
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
