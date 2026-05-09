; DESCRIPTION: Draws a red line from (67, 255) to (230, 135).
; PLAN: r0=67(x1), r1=255(y1), r2=230(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 255
LDI r2, 230
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
