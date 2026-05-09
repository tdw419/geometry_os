; DESCRIPTION: Renders a orange line between points (53, 239) and (65, 133).
; PLAN: r0=53(x1), r1=239(y1), r2=65(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 239
LDI r2, 65
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
