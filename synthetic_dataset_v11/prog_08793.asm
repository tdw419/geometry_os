; DESCRIPTION: Draws a green rectangle at (226, 39) with width 24 and height 40.
; PLAN: r0=226(x), r1=39(y), r2=24(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 39
LDI r2, 24
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
