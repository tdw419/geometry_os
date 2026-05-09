; DESCRIPTION: Draws a black rectangle at (238, 21) with width 61 and height 48.
; PLAN: r0=238(x), r1=21(y), r2=61(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 21
LDI r2, 61
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
