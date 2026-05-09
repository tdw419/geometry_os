; DESCRIPTION: Places a white line segment connecting (206, 191) to (440, 254).
; PLAN: r0=206(x1), r1=191(y1), r2=440(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 191
LDI r2, 440
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
