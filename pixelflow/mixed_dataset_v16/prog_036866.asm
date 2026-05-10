; DESCRIPTION: Draws a black rectangle at (294, 48) with width 93 and height 118.
; PLAN: r0=294(x), r1=48(y), r2=93(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 48
LDI r2, 93
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
