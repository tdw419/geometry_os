; DESCRIPTION: Draws a yellow rectangle at (196, 93) with width 57 and height 73.
; PLAN: r0=196(x), r1=93(y), r2=57(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 93
LDI r2, 57
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
