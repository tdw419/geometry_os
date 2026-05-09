; DESCRIPTION: Draws a orange line from (154, 173) to (302, 204).
; PLAN: r0=154(x1), r1=173(y1), r2=302(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 173
LDI r2, 302
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
