; DESCRIPTION: Draws a orange line from (144, 23) to (479, 17).
; PLAN: r0=144(x1), r1=23(y1), r2=479(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 23
LDI r2, 479
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
