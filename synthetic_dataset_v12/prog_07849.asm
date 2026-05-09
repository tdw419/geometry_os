; DESCRIPTION: Draws a orange line from (406, 5) to (167, 210).
; PLAN: r0=406(x1), r1=5(y1), r2=167(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 5
LDI r2, 167
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
