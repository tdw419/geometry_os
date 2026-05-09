; DESCRIPTION: Draws a white line from (255, 113) to (250, 118).
; PLAN: r0=255(x1), r1=113(y1), r2=250(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 113
LDI r2, 250
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
