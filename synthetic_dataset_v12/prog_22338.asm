; DESCRIPTION: Draws a red rectangle at (352, 43) with width 27 and height 102.
; PLAN: r0=352(x), r1=43(y), r2=27(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 43
LDI r2, 27
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
