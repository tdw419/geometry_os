; DESCRIPTION: Places a white line segment connecting (122, 175) to (239, 43).
; PLAN: r0=122(x1), r1=175(y1), r2=239(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 175
LDI r2, 239
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
