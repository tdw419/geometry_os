; DESCRIPTION: Draws a green rectangle at (168, 28) with width 55 and height 61.
; PLAN: r0=168(x), r1=28(y), r2=55(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 28
LDI r2, 55
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
