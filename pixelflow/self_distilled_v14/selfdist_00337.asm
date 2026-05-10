; DESCRIPTION: Draws a red rectangle at (168, 167) with width 93 and height 23.
; PLAN: r0=168(x), r1=167(y), r2=93(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 167
LDI r2, 93
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
