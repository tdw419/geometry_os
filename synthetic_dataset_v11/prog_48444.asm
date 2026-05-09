; DESCRIPTION: Draws a red line from (211, 110) to (239, 45).
; PLAN: r0=211(x1), r1=110(y1), r2=239(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 110
LDI r2, 239
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
