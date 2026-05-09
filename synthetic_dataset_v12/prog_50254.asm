; DESCRIPTION: Places a cyan line segment connecting (348, 206) to (226, 4).
; PLAN: r0=348(x1), r1=206(y1), r2=226(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 206
LDI r2, 226
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
