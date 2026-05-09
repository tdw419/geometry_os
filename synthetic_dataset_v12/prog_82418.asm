; DESCRIPTION: Places a orange line segment connecting (32, 32) to (404, 40).
; PLAN: r0=32(x1), r1=32(y1), r2=404(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 32
LDI r2, 404
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
