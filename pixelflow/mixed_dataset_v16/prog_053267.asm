; DESCRIPTION: Draws a red line from (433, 214) to (46, 122).
; PLAN: r0=433(x1), r1=214(y1), r2=46(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 214
LDI r2, 46
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
