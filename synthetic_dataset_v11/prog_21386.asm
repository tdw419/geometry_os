; DESCRIPTION: Draws a purple rectangle at (34, 146) with width 14 and height 40.
; PLAN: r0=34(x), r1=146(y), r2=14(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 146
LDI r2, 14
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
