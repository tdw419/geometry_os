; DESCRIPTION: Places a cyan line segment connecting (473, 158) to (191, 239).
; PLAN: r0=473(x1), r1=158(y1), r2=191(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 158
LDI r2, 191
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
