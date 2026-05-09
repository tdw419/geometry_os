; DESCRIPTION: Places a orange line segment connecting (217, 224) to (305, 107).
; PLAN: r0=217(x1), r1=224(y1), r2=305(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 224
LDI r2, 305
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
