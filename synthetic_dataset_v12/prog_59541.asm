; DESCRIPTION: Draws a red rectangle at (341, 38) with width 98 and height 40.
; PLAN: r0=341(x), r1=38(y), r2=98(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 38
LDI r2, 98
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
