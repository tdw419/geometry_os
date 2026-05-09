; DESCRIPTION: Places a white line segment connecting (473, 32) to (494, 254).
; PLAN: r0=473(x1), r1=32(y1), r2=494(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 32
LDI r2, 494
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
