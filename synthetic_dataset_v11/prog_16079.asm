; DESCRIPTION: Draws a black line from (208, 108) to (224, 75).
; PLAN: r0=208(x1), r1=108(y1), r2=224(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 108
LDI r2, 224
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
