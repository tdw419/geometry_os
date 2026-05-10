; DESCRIPTION: Draws a red rectangle at (301, 6) with width 117 and height 82.
; PLAN: r0=301(x), r1=6(y), r2=117(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 6
LDI r2, 117
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
