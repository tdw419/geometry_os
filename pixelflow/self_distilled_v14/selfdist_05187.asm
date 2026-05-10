; DESCRIPTION: Draws a red rectangle at (390, 27) with width 24 and height 82.
; PLAN: r0=390(x), r1=27(y), r2=24(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 27
LDI r2, 24
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
