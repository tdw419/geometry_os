; DESCRIPTION: Draws a cyan rectangle at (343, 32) with width 113 and height 85.
; PLAN: r0=343(x), r1=32(y), r2=113(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 32
LDI r2, 113
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
