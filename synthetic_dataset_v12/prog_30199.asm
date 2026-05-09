; DESCRIPTION: Draws a orange line from (129, 221) to (224, 171).
; PLAN: r0=129(x1), r1=221(y1), r2=224(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 221
LDI r2, 224
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
