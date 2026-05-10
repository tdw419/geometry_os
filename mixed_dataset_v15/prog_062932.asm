; DESCRIPTION: Places a red line segment connecting (198, 144) to (83, 215).
; PLAN: r0=198(x1), r1=144(y1), r2=83(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 144
LDI r2, 83
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
