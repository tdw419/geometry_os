; DESCRIPTION: Draws a white rectangle at (371, 11) with width 82 and height 64.
; PLAN: r0=371(x), r1=11(y), r2=82(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 11
LDI r2, 82
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
