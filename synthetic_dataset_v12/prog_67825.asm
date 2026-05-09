; DESCRIPTION: Places a white line segment connecting (153, 135) to (389, 239).
; PLAN: r0=153(x1), r1=135(y1), r2=389(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 135
LDI r2, 389
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
