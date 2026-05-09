; DESCRIPTION: Draws a white line from (239, 212) to (414, 53).
; PLAN: r0=239(x1), r1=212(y1), r2=414(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 212
LDI r2, 414
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
