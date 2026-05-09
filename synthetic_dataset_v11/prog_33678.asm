; DESCRIPTION: Composite: . Then Renders a orange disk with center (160, 128) and radius 79. Then Draws a purple rectangle at (48, 152) with width 72 and height 68.
; PLAN: r0=160(x), r1=128(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=48(x), r1=152(y), r2=72(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (160, 128) and radius 79.
; PLAN: r0=160(x), r1=128(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 128
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple rectangle at (48, 152) with width 72 and height 68.
; PLAN: r0=48(x), r1=152(y), r2=72(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 152
LDI r2, 72
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
