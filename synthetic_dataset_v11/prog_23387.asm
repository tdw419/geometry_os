; DESCRIPTION: Draws a red rectangle at (182, 163) with width 70 and height 47.
; PLAN: r0=182(x), r1=163(y), r2=70(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 163
LDI r2, 70
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
