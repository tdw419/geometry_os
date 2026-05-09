; DESCRIPTION: Draws a red rectangle at (226, 16) with width 15 and height 93.
; PLAN: r0=226(x), r1=16(y), r2=15(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 16
LDI r2, 15
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
