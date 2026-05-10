; DESCRIPTION: Draws a red rectangle at (434, 19) with width 24 and height 86.
; PLAN: r0=434(x), r1=19(y), r2=24(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 19
LDI r2, 24
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
