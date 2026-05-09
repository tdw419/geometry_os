; DESCRIPTION: Renders a cyan line between points (338, 202) and (348, 125).
; PLAN: r0=338(x1), r1=202(y1), r2=348(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 202
LDI r2, 348
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
