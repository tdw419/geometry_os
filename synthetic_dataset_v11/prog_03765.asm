; DESCRIPTION: Draws a yellow rectangle at (59, 73) with width 32 and height 93.
; PLAN: r0=59(x), r1=73(y), r2=32(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 73
LDI r2, 32
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
