; DESCRIPTION: Draws a orange line from (401, 60) to (46, 166).
; PLAN: r0=401(x1), r1=60(y1), r2=46(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 60
LDI r2, 46
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
