; DESCRIPTION: Draws a blue line from (224, 32) to (95, 104).
; PLAN: r0=224(x1), r1=32(y1), r2=95(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 32
LDI r2, 95
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
