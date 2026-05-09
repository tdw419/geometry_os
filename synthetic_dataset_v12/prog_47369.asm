; DESCRIPTION: Renders a red line between points (480, 81) and (452, 239).
; PLAN: r0=480(x1), r1=81(y1), r2=452(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 81
LDI r2, 452
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
