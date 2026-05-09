; DESCRIPTION: Draws a purple line from (255, 228) to (495, 98).
; PLAN: r0=255(x1), r1=228(y1), r2=495(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 228
LDI r2, 495
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
