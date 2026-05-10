; DESCRIPTION: Draws a cyan rectangle at (150, 183) with width 64 and height 42.
; PLAN: r0=150(x), r1=183(y), r2=64(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 183
LDI r2, 64
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
