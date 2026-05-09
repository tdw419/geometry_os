; DESCRIPTION: Places a orange line segment connecting (340, 82) to (25, 236).
; PLAN: r0=340(x1), r1=82(y1), r2=25(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 82
LDI r2, 25
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
