; DESCRIPTION: Places a green line segment connecting (211, 76) to (405, 203).
; PLAN: r0=211(x1), r1=76(y1), r2=405(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 76
LDI r2, 405
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
