; DESCRIPTION: Draws a yellow line from (348, 20) to (488, 225).
; PLAN: r0=348(x1), r1=20(y1), r2=488(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 20
LDI r2, 488
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
