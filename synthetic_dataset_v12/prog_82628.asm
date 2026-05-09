; DESCRIPTION: Draws a black rectangle at (405, 61) with width 35 and height 42.
; PLAN: r0=405(x), r1=61(y), r2=35(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 61
LDI r2, 35
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
