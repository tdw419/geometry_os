; DESCRIPTION: Draws a red line from (74, 5) to (274, 239).
; PLAN: r0=74(x1), r1=5(y1), r2=274(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 5
LDI r2, 274
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
