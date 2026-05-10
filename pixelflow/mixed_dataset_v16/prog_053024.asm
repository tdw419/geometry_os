; DESCRIPTION: Draws a orange line from (511, 27) to (452, 82).
; PLAN: r0=511(x1), r1=27(y1), r2=452(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 27
LDI r2, 452
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
