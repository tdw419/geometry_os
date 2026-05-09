; DESCRIPTION: Places a orange line segment connecting (135, 32) to (305, 68).
; PLAN: r0=135(x1), r1=32(y1), r2=305(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 32
LDI r2, 305
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
