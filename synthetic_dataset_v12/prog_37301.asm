; DESCRIPTION: Draws a black rectangle at (206, 206) with width 111 and height 25.
; PLAN: r0=206(x), r1=206(y), r2=111(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 206
LDI r2, 111
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
