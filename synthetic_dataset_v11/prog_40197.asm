; DESCRIPTION: Draws a red rectangle at (28, 4) with width 71 and height 109.
; PLAN: r0=28(x), r1=4(y), r2=71(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 4
LDI r2, 71
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
