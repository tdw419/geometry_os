; DESCRIPTION: Draws a red rectangle at (363, 102) with width 113 and height 57.
; PLAN: r0=363(x), r1=102(y), r2=113(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 102
LDI r2, 113
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
