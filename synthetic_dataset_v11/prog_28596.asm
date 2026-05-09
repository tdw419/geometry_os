; DESCRIPTION: Draws a green rectangle at (92, 66) with width 18 and height 82.
; PLAN: r0=92(x), r1=66(y), r2=18(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 66
LDI r2, 18
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
