; DESCRIPTION: Draws a orange line from (291, 104) to (416, 30).
; PLAN: r0=291(x1), r1=104(y1), r2=416(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 104
LDI r2, 416
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
