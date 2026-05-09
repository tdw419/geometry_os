; DESCRIPTION: Places a green line segment connecting (342, 209) to (463, 203).
; PLAN: r0=342(x1), r1=209(y1), r2=463(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 209
LDI r2, 463
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
