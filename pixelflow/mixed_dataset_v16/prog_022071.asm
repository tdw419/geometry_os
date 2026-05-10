; DESCRIPTION: Draws a black rectangle at (264, 171) with width 48 and height 58.
; PLAN: r0=264(x), r1=171(y), r2=48(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 171
LDI r2, 48
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
