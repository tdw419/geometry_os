; DESCRIPTION: Places a black line segment connecting (396, 209) to (217, 189).
; PLAN: r0=396(x1), r1=209(y1), r2=217(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 209
LDI r2, 217
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
