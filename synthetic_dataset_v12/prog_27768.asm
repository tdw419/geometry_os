; DESCRIPTION: Draws a cyan rectangle at (122, 42) with width 38 and height 82.
; PLAN: r0=122(x), r1=42(y), r2=38(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 42
LDI r2, 38
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
