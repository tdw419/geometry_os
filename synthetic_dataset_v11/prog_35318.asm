; DESCRIPTION: Draws a green rectangle at (16, 165) with width 92 and height 91.
; PLAN: r0=16(x), r1=165(y), r2=92(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 165
LDI r2, 92
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
