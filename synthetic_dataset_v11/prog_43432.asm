; DESCRIPTION: Draws a black rectangle at (149, 146) with width 48 and height 99.
; PLAN: r0=149(x), r1=146(y), r2=48(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 146
LDI r2, 48
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
