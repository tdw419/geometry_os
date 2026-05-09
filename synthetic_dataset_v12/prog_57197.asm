; DESCRIPTION: Draws a red rectangle at (303, 157) with width 91 and height 59.
; PLAN: r0=303(x), r1=157(y), r2=91(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 157
LDI r2, 91
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
