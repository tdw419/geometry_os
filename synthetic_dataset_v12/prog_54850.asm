; DESCRIPTION: Places a cyan line segment connecting (348, 150) to (464, 125).
; PLAN: r0=348(x1), r1=150(y1), r2=464(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 150
LDI r2, 464
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
