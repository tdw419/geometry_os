; DESCRIPTION: Draws a blue line from (117, 107) to (70, 224).
; PLAN: r0=117(x1), r1=107(y1), r2=70(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 107
LDI r2, 70
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
