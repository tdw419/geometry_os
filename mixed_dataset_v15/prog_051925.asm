; DESCRIPTION: Draws a yellow rectangle at (380, 54) with width 116 and height 27.
; PLAN: r0=380(x), r1=54(y), r2=116(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 54
LDI r2, 116
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
