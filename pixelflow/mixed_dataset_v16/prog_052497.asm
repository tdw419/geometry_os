; DESCRIPTION: Draws a red line from (222, 12) to (241, 134).
; PLAN: r0=222(x1), r1=12(y1), r2=241(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 12
LDI r2, 241
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
