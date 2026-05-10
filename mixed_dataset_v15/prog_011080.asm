; DESCRIPTION: Places a green line segment connecting (196, 203) to (405, 118).
; PLAN: r0=196(x1), r1=203(y1), r2=405(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 203
LDI r2, 405
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
