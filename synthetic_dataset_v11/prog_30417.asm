; DESCRIPTION: Draws a red rectangle at (68, 23) with width 82 and height 112.
; PLAN: r0=68(x), r1=23(y), r2=82(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 23
LDI r2, 82
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
