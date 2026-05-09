; DESCRIPTION: Draws a orange line from (281, 152) to (207, 76).
; PLAN: r0=281(x1), r1=152(y1), r2=207(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 152
LDI r2, 207
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
