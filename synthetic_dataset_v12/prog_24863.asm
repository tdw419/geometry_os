; DESCRIPTION: Draws a cyan rectangle at (296, 66) with width 39 and height 42.
; PLAN: r0=296(x), r1=66(y), r2=39(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 66
LDI r2, 39
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
