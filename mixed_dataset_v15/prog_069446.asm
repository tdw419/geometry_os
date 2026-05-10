; DESCRIPTION: Draws a green rectangle at (253, 16) with width 76 and height 42.
; PLAN: r0=253(x), r1=16(y), r2=76(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 16
LDI r2, 76
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
