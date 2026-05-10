; DESCRIPTION: Places a red line segment connecting (365, 252) to (464, 254).
; PLAN: r0=365(x1), r1=252(y1), r2=464(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 252
LDI r2, 464
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
