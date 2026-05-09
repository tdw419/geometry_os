; DESCRIPTION: Draws a red rectangle at (163, 224) with width 80 and height 27.
; PLAN: r0=163(x), r1=224(y), r2=80(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 224
LDI r2, 80
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
