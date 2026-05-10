; DESCRIPTION: Places a black line segment connecting (3, 173) to (336, 209).
; PLAN: r0=3(x1), r1=173(y1), r2=336(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 173
LDI r2, 336
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
