; DESCRIPTION: Places a white line segment connecting (348, 59) to (440, 125).
; PLAN: r0=348(x1), r1=59(y1), r2=440(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 59
LDI r2, 440
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
