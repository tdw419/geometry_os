; DESCRIPTION: Draws a orange line from (168, 214) to (199, 255).
; PLAN: r0=168(x1), r1=214(y1), r2=199(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 214
LDI r2, 199
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
