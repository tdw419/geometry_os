; DESCRIPTION: Places a white line segment connecting (440, 21) to (337, 206).
; PLAN: r0=440(x1), r1=21(y1), r2=337(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 21
LDI r2, 337
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
