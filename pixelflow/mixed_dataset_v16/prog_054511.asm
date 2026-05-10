; DESCRIPTION: Draws a cyan rectangle at (61, 166) with width 55 and height 28.
; PLAN: r0=61(x), r1=166(y), r2=55(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 166
LDI r2, 55
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
