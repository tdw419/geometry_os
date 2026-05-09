; DESCRIPTION: Draws a red rectangle at (35, 82) with width 12 and height 46.
; PLAN: r0=35(x), r1=82(y), r2=12(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 82
LDI r2, 12
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
