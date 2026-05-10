; DESCRIPTION: Draws a blue rectangle at (333, 73) with width 44 and height 48.
; PLAN: r0=333(x), r1=73(y), r2=44(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 73
LDI r2, 44
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
