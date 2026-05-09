; DESCRIPTION: Draws a red rectangle at (337, 135) with width 98 and height 39.
; PLAN: r0=337(x), r1=135(y), r2=98(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 135
LDI r2, 98
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
