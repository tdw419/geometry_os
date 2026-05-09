; DESCRIPTION: Draws a orange line from (107, 78) to (213, 19).
; PLAN: r0=107(x1), r1=78(y1), r2=213(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 78
LDI r2, 213
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
