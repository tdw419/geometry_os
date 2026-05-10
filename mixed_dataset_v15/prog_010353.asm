; DESCRIPTION: Draws a green rectangle at (309, 228) with width 98 and height 22.
; PLAN: r0=309(x), r1=228(y), r2=98(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 228
LDI r2, 98
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
