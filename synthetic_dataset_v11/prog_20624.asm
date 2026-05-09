; DESCRIPTION: Draws a red rectangle at (168, 161) with width 24 and height 35.
; PLAN: r0=168(x), r1=161(y), r2=24(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 161
LDI r2, 24
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
