; DESCRIPTION: Draws a yellow rectangle at (292, 16) with width 34 and height 24.
; PLAN: r0=292(x), r1=16(y), r2=34(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 16
LDI r2, 34
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
