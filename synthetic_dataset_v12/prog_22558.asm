; DESCRIPTION: Draws a green rectangle at (32, 189) with width 70 and height 42.
; PLAN: r0=32(x), r1=189(y), r2=70(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 189
LDI r2, 70
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
