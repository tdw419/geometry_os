; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).
; PLAN: r0=0(x1), r1=0(y1), r2=255(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 0
LDI r2, 255
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT