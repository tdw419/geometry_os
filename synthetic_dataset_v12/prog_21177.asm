; DESCRIPTION: Places a orange line segment connecting (239, 180) to (26, 125).
; PLAN: r0=239(x1), r1=180(y1), r2=26(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 180
LDI r2, 26
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
