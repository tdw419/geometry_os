; DESCRIPTION: Draws a black line from (281, 96) to (224, 35).
; PLAN: r0=281(x1), r1=96(y1), r2=224(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 96
LDI r2, 224
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
