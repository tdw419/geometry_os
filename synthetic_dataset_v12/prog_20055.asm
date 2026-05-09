; DESCRIPTION: Draws a orange line from (482, 205) to (16, 211).
; PLAN: r0=482(x1), r1=205(y1), r2=16(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 205
LDI r2, 16
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
