; DESCRIPTION: Draws a red rectangle at (135, 164) with width 60 and height 59.
; PLAN: r0=135(x), r1=164(y), r2=60(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 164
LDI r2, 60
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
