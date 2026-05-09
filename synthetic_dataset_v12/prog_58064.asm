; DESCRIPTION: Draws a orange line from (354, 144) to (440, 186).
; PLAN: r0=354(x1), r1=144(y1), r2=440(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 144
LDI r2, 440
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
