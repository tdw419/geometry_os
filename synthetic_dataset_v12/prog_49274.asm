; DESCRIPTION: Draws a yellow rectangle at (264, 39) with width 58 and height 32.
; PLAN: r0=264(x), r1=39(y), r2=58(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 39
LDI r2, 58
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
