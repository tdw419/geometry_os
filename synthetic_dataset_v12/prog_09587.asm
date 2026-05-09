; DESCRIPTION: Places a orange line segment connecting (287, 186) to (82, 32).
; PLAN: r0=287(x1), r1=186(y1), r2=82(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 186
LDI r2, 82
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
