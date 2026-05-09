; DESCRIPTION: Draws a yellow rectangle at (95, 109) with width 57 and height 83.
; PLAN: r0=95(x), r1=109(y), r2=57(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 109
LDI r2, 57
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
