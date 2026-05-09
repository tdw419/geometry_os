; DESCRIPTION: Draws a orange line from (198, 167) to (309, 27).
; PLAN: r0=198(x1), r1=167(y1), r2=309(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 167
LDI r2, 309
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
