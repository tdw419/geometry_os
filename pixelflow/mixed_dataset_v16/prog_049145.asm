; DESCRIPTION: Draws a white line from (203, 55) to (248, 255).
; PLAN: r0=203(x1), r1=55(y1), r2=248(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 55
LDI r2, 248
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
