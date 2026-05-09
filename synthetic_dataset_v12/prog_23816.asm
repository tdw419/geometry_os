; DESCRIPTION: Places a orange line segment connecting (405, 189) to (479, 35).
; PLAN: r0=405(x1), r1=189(y1), r2=479(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 189
LDI r2, 479
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
