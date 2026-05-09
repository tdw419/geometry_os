; DESCRIPTION: Places a orange line segment connecting (61, 215) to (416, 148).
; PLAN: r0=61(x1), r1=215(y1), r2=416(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 215
LDI r2, 416
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
