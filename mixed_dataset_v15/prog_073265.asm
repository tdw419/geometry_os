; DESCRIPTION: Places a white line segment connecting (454, 199) to (479, 62).
; PLAN: r0=454(x1), r1=199(y1), r2=479(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 199
LDI r2, 479
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
