; DESCRIPTION: Places a white line segment connecting (321, 140) to (239, 225).
; PLAN: r0=321(x1), r1=140(y1), r2=239(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 140
LDI r2, 239
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
