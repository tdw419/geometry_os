; DESCRIPTION: Draws a red rectangle at (144, 23) with width 93 and height 14.
; PLAN: r0=144(x), r1=23(y), r2=93(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 23
LDI r2, 93
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
