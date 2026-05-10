; DESCRIPTION: Places a yellow line segment connecting (232, 37) to (365, 166).
; PLAN: r0=232(x1), r1=37(y1), r2=365(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 37
LDI r2, 365
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
