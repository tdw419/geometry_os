; DESCRIPTION: Places a orange line segment connecting (479, 58) to (76, 101).
; PLAN: r0=479(x1), r1=58(y1), r2=76(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 58
LDI r2, 76
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
