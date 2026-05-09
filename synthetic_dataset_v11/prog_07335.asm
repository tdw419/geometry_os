; DESCRIPTION: Draws a yellow rectangle at (32, 83) with width 93 and height 60.
; PLAN: r0=32(x), r1=83(y), r2=93(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 83
LDI r2, 93
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
