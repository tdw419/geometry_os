; DESCRIPTION: Draws a green rectangle at (113, 82) with width 52 and height 27.
; PLAN: r0=113(x), r1=82(y), r2=52(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 82
LDI r2, 52
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
