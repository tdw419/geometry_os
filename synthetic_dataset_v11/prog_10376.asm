; DESCRIPTION: Draws a yellow line from (255, 0) to (173, 245).
; PLAN: r0=255(x1), r1=0(y1), r2=173(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 0
LDI r2, 173
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
