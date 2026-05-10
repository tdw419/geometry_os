; DESCRIPTION: Draws a red rectangle at (352, 28) with width 55 and height 13.
; PLAN: r0=352(x), r1=28(y), r2=55(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 28
LDI r2, 55
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
