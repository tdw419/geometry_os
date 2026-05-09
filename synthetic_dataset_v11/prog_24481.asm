; DESCRIPTION: Draws a red line from (255, 104) to (59, 130).
; PLAN: r0=255(x1), r1=104(y1), r2=59(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 104
LDI r2, 59
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
