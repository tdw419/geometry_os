; DESCRIPTION: Draws a green rectangle at (61, 178) with width 76 and height 42.
; PLAN: r0=61(x), r1=178(y), r2=76(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 178
LDI r2, 76
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
