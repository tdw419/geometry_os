; DESCRIPTION: Draws a white rectangle at (228, 128) with width 62 and height 49.
; PLAN: r0=228(x), r1=128(y), r2=62(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 128
LDI r2, 62
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
