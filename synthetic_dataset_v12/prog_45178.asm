; DESCRIPTION: Draws a green rectangle at (242, 4) with width 93 and height 70.
; PLAN: r0=242(x), r1=4(y), r2=93(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 4
LDI r2, 93
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
