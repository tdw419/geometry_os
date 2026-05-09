; DESCRIPTION: Draws a orange line from (401, 180) to (181, 190).
; PLAN: r0=401(x1), r1=180(y1), r2=181(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 180
LDI r2, 181
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
