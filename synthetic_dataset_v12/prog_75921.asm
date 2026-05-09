; DESCRIPTION: Draws a green rectangle at (186, 139) with width 86 and height 93.
; PLAN: r0=186(x), r1=139(y), r2=86(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 139
LDI r2, 86
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
