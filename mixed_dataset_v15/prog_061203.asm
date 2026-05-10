; DESCRIPTION: Draws a red rectangle at (256, 125) with width 93 and height 83.
; PLAN: r0=256(x), r1=125(y), r2=93(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 125
LDI r2, 93
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
