; DESCRIPTION: Draws a orange line from (259, 134) to (167, 166).
; PLAN: r0=259(x1), r1=134(y1), r2=167(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 134
LDI r2, 167
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
