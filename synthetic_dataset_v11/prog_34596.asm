; DESCRIPTION: Draws a orange line from (222, 228) to (131, 255).
; PLAN: r0=222(x1), r1=228(y1), r2=131(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 228
LDI r2, 131
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
