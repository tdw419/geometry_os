; DESCRIPTION: Places a orange line segment connecting (479, 155) to (224, 167).
; PLAN: r0=479(x1), r1=155(y1), r2=224(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 155
LDI r2, 224
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
