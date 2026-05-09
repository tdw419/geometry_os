; DESCRIPTION: Places a red line segment connecting (440, 126) to (484, 12).
; PLAN: r0=440(x1), r1=126(y1), r2=484(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 126
LDI r2, 484
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
