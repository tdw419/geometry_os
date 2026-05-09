; DESCRIPTION: Draws a purple rectangle at (224, 133) with width 104 and height 80.
; PLAN: r0=224(x), r1=133(y), r2=104(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 133
LDI r2, 104
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
