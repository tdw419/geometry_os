; DESCRIPTION: Draws a red rectangle at (355, 111) with width 45 and height 39.
; PLAN: r0=355(x), r1=111(y), r2=45(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 111
LDI r2, 45
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
