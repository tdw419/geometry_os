; DESCRIPTION: Draws a white rectangle at (111, 34) with width 109 and height 68.
; PLAN: r0=111(x), r1=34(y), r2=109(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 34
LDI r2, 109
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
