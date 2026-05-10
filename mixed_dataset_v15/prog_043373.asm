; DESCRIPTION: Renders a orange line between points (278, 239) and (234, 95).
; PLAN: r0=278(x1), r1=239(y1), r2=234(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 239
LDI r2, 234
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
