; DESCRIPTION: Draws a red rectangle at (128, 35) with width 49 and height 27.
; PLAN: r0=128(x), r1=35(y), r2=49(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 35
LDI r2, 49
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
