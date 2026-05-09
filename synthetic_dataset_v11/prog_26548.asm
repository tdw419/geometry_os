; DESCRIPTION: Draws a white line from (224, 141) to (41, 244).
; PLAN: r0=224(x1), r1=141(y1), r2=41(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 141
LDI r2, 41
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
