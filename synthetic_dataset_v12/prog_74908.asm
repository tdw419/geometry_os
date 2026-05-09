; DESCRIPTION: Draws a red rectangle at (148, 67) with width 59 and height 83.
; PLAN: r0=148(x), r1=67(y), r2=59(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 67
LDI r2, 59
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
