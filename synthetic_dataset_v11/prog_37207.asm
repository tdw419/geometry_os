; DESCRIPTION: Draws a green rectangle at (202, 5) with width 39 and height 100.
; PLAN: r0=202(x), r1=5(y), r2=39(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 5
LDI r2, 39
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
