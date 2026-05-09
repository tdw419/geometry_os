; DESCRIPTION: Draws a white rectangle at (42, 115) with width 67 and height 111.
; PLAN: r0=42(x), r1=115(y), r2=67(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 115
LDI r2, 67
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
