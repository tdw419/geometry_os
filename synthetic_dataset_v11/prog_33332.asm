; DESCRIPTION: Draws a red rectangle at (111, 148) with width 60 and height 82.
; PLAN: r0=111(x), r1=148(y), r2=60(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 148
LDI r2, 60
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
