; DESCRIPTION: Draws a red rectangle at (0, 149) with width 93 and height 57.
; PLAN: r0=0(x), r1=149(y), r2=93(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 149
LDI r2, 93
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
