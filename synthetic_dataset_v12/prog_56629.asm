; DESCRIPTION: Draws a yellow line from (329, 79) to (120, 174).
; PLAN: r0=329(x1), r1=79(y1), r2=120(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 79
LDI r2, 120
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
