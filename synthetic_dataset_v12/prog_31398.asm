; DESCRIPTION: Places a cyan line segment connecting (426, 178) to (452, 122).
; PLAN: r0=426(x1), r1=178(y1), r2=452(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 178
LDI r2, 452
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
