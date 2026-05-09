; DESCRIPTION: Draws a green line from (79, 230) to (45, 224).
; PLAN: r0=79(x1), r1=230(y1), r2=45(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 230
LDI r2, 45
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
