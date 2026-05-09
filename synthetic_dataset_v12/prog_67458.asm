; DESCRIPTION: Draws a red rectangle at (409, 93) with width 35 and height 82.
; PLAN: r0=409(x), r1=93(y), r2=35(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 93
LDI r2, 35
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
