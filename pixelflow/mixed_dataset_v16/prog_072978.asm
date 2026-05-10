; DESCRIPTION: Places a orange line segment connecting (305, 97) to (502, 1).
; PLAN: r0=305(x1), r1=97(y1), r2=502(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 97
LDI r2, 502
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
