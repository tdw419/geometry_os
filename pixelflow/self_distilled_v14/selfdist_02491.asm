; DESCRIPTION: Draws a green rectangle at (379, 146) with width 119 and height 32.
; PLAN: r0=379(x), r1=146(y), r2=119(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 146
LDI r2, 119
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
