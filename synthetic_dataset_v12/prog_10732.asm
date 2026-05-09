; DESCRIPTION: Draws a orange line from (479, 132) to (394, 54).
; PLAN: r0=479(x1), r1=132(y1), r2=394(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 132
LDI r2, 394
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
