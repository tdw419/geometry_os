; DESCRIPTION: Draws a black rectangle at (434, 97) with width 13 and height 42.
; PLAN: r0=434(x), r1=97(y), r2=13(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 97
LDI r2, 13
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
