; DESCRIPTION: Draws a cyan rectangle at (157, 143) with width 42 and height 101.
; PLAN: r0=157(x), r1=143(y), r2=42(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 143
LDI r2, 42
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
