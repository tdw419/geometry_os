; DESCRIPTION: Draws a white rectangle at (255, 82) with width 53 and height 39.
; PLAN: r0=255(x), r1=82(y), r2=53(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 82
LDI r2, 53
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
