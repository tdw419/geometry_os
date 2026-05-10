; DESCRIPTION: Draws a red line from (113, 46) to (239, 156).
; PLAN: r0=113(x1), r1=46(y1), r2=239(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 46
LDI r2, 239
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
