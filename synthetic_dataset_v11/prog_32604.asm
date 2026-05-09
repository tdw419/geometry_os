; DESCRIPTION: Draws a green rectangle at (38, 163) with width 68 and height 86.
; PLAN: r0=38(x), r1=163(y), r2=68(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 163
LDI r2, 68
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
