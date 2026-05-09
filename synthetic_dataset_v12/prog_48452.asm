; DESCRIPTION: Draws a red line from (273, 163) to (239, 116).
; PLAN: r0=273(x1), r1=163(y1), r2=239(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 163
LDI r2, 239
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
