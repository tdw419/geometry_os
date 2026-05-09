; DESCRIPTION: Draws a red rectangle at (37, 45) with width 86 and height 32.
; PLAN: r0=37(x), r1=45(y), r2=86(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 45
LDI r2, 86
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
