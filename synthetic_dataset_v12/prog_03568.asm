; DESCRIPTION: Draws a black rectangle at (275, 64) with width 42 and height 113.
; PLAN: r0=275(x), r1=64(y), r2=42(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 64
LDI r2, 42
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
