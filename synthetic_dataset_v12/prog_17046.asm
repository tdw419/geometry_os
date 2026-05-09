; DESCRIPTION: Draws a black rectangle at (320, 57) with width 42 and height 53.
; PLAN: r0=320(x), r1=57(y), r2=42(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 57
LDI r2, 42
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
