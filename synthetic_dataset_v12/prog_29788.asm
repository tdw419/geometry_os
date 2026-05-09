; DESCRIPTION: Draws a green rectangle at (73, 16) with width 38 and height 60.
; PLAN: r0=73(x), r1=16(y), r2=38(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 16
LDI r2, 38
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
