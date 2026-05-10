; DESCRIPTION: Draws a white rectangle at (354, 111) with width 47 and height 68.
; PLAN: r0=354(x), r1=111(y), r2=47(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 111
LDI r2, 47
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
