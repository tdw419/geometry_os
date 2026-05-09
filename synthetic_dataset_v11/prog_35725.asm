; DESCRIPTION: Draws a orange line from (154, 102) to (138, 210).
; PLAN: r0=154(x1), r1=102(y1), r2=138(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 102
LDI r2, 138
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
