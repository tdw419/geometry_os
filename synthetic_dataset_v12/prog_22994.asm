; DESCRIPTION: Draws a black rectangle at (129, 202) with width 86 and height 48.
; PLAN: r0=129(x), r1=202(y), r2=86(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 202
LDI r2, 86
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
