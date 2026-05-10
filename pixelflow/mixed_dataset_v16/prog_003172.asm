; DESCRIPTION: Draws a red rectangle at (406, 111) with width 49 and height 109.
; PLAN: r0=406(x), r1=111(y), r2=49(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 111
LDI r2, 49
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
