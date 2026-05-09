; DESCRIPTION: Draws a red rectangle at (154, 20) with width 15 and height 111.
; PLAN: r0=154(x), r1=20(y), r2=15(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 20
LDI r2, 15
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
