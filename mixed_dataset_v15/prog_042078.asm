; DESCRIPTION: Draws a orange line from (401, 149) to (352, 27).
; PLAN: r0=401(x1), r1=149(y1), r2=352(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 149
LDI r2, 352
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
