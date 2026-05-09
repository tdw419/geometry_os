; DESCRIPTION: Draws a white line from (122, 224) to (46, 217).
; PLAN: r0=122(x1), r1=224(y1), r2=46(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 224
LDI r2, 46
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
