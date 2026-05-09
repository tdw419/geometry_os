; DESCRIPTION: Draws a red rectangle at (58, 112) with width 91 and height 101.
; PLAN: r0=58(x), r1=112(y), r2=91(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 112
LDI r2, 91
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
