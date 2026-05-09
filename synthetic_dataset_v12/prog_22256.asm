; DESCRIPTION: Places a black line segment connecting (336, 209) to (171, 179).
; PLAN: r0=336(x1), r1=209(y1), r2=171(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 209
LDI r2, 171
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
