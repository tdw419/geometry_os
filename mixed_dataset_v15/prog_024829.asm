; DESCRIPTION: Draws a orange line from (99, 239) to (189, 231).
; PLAN: r0=99(x1), r1=239(y1), r2=189(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 239
LDI r2, 189
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
