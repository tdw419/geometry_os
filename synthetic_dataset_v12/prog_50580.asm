; DESCRIPTION: Renders a red line between points (255, 9) and (497, 165).
; PLAN: r0=255(x1), r1=9(y1), r2=497(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 9
LDI r2, 497
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
