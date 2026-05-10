; DESCRIPTION: Draws a orange line from (281, 91) to (213, 187).
; PLAN: r0=281(x1), r1=91(y1), r2=213(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 91
LDI r2, 213
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
