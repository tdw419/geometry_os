; DESCRIPTION: Draws a red rectangle at (72, 163) with width 82 and height 17.
; PLAN: r0=72(x), r1=163(y), r2=82(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 163
LDI r2, 82
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
