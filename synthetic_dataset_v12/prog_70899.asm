; DESCRIPTION: Draws a red rectangle at (405, 138) with width 98 and height 76.
; PLAN: r0=405(x), r1=138(y), r2=98(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 138
LDI r2, 98
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
