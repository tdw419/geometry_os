; DESCRIPTION: Draws a blue rectangle at (346, 146) with width 31 and height 86.
; PLAN: r0=346(x), r1=146(y), r2=31(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 146
LDI r2, 31
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
