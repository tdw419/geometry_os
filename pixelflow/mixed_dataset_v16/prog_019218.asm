; DESCRIPTION: Draws a red line from (83, 113) to (255, 107).
; PLAN: r0=83(x1), r1=113(y1), r2=255(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 113
LDI r2, 255
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
