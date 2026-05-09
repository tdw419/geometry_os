; DESCRIPTION: Draws a white line from (224, 222) to (452, 92).
; PLAN: r0=224(x1), r1=222(y1), r2=452(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 222
LDI r2, 452
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
