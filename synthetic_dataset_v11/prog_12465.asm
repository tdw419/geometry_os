; DESCRIPTION: Draws a red rectangle at (15, 27) with width 52 and height 32.
; PLAN: r0=15(x), r1=27(y), r2=52(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 27
LDI r2, 52
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
