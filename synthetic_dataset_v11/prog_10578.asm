; DESCRIPTION: Draws a orange line from (46, 30) to (2, 213).
; PLAN: r0=46(x1), r1=30(y1), r2=2(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 30
LDI r2, 2
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
