; DESCRIPTION: Draws a red line from (239, 87) to (477, 108).
; PLAN: r0=239(x1), r1=87(y1), r2=477(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 87
LDI r2, 477
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
