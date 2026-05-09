; DESCRIPTION: Draws a red rectangle at (163, 4) with width 64 and height 106.
; PLAN: r0=163(x), r1=4(y), r2=64(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 4
LDI r2, 64
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
