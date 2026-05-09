; DESCRIPTION: Draws a red rectangle at (477, 8) with width 20 and height 95.
; PLAN: r0=477(x), r1=8(y), r2=20(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 8
LDI r2, 20
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
