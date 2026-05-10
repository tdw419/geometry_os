; DESCRIPTION: Draws a blue rectangle at (242, 99) with width 93 and height 71.
; PLAN: r0=242(x), r1=99(y), r2=93(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 99
LDI r2, 93
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
