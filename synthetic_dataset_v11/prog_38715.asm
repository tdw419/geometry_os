; DESCRIPTION: Draws a red line from (212, 161) to (239, 63).
; PLAN: r0=212(x1), r1=161(y1), r2=239(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 161
LDI r2, 239
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
