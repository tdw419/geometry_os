; DESCRIPTION: Draws a red rectangle at (294, 219) with width 85 and height 30.
; PLAN: r0=294(x), r1=219(y), r2=85(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 219
LDI r2, 85
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
