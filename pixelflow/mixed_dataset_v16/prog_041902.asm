; DESCRIPTION: Draws a red rectangle at (176, 12) with width 45 and height 13.
; PLAN: r0=176(x), r1=12(y), r2=45(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 12
LDI r2, 45
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
