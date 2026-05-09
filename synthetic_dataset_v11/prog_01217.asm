; DESCRIPTION: Draws a magenta line from (55, 239) to (245, 95).
; PLAN: r0=55(x1), r1=239(y1), r2=245(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 239
LDI r2, 245
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
