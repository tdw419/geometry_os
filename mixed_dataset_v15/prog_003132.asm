; DESCRIPTION: Places a orange line segment connecting (32, 226) to (284, 92).
; PLAN: r0=32(x1), r1=226(y1), r2=284(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 226
LDI r2, 284
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
