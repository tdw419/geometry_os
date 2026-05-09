; DESCRIPTION: Draws a red rectangle at (224, 8) with width 15 and height 120.
; PLAN: r0=224(x), r1=8(y), r2=15(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 8
LDI r2, 15
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
