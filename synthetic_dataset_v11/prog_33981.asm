; DESCRIPTION: Draws a red rectangle at (127, 154) with width 108 and height 76.
; PLAN: r0=127(x), r1=154(y), r2=108(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 154
LDI r2, 108
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
