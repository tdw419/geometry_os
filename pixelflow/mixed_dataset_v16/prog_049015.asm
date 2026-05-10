; DESCRIPTION: Draws a orange rectangle at (474, 221) with width 14 and height 28.
; PLAN: r0=474(x), r1=221(y), r2=14(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 221
LDI r2, 14
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
