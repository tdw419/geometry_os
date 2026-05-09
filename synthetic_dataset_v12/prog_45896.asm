; DESCRIPTION: Places a cyan line segment connecting (348, 113) to (338, 181).
; PLAN: r0=348(x1), r1=113(y1), r2=338(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 113
LDI r2, 338
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
