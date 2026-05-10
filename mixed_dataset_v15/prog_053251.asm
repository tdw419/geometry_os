; DESCRIPTION: Draws a yellow rectangle at (324, 16) with width 48 and height 34.
; PLAN: r0=324(x), r1=16(y), r2=48(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 16
LDI r2, 48
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
