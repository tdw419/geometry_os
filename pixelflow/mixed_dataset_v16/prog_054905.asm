; DESCRIPTION: Draws a green rectangle at (410, 99) with width 32 and height 37.
; PLAN: r0=410(x), r1=99(y), r2=32(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 99
LDI r2, 32
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
