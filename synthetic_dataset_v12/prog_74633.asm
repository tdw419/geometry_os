; DESCRIPTION: Draws a black rectangle at (7, 146) with width 109 and height 86.
; PLAN: r0=7(x), r1=146(y), r2=109(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 146
LDI r2, 109
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
