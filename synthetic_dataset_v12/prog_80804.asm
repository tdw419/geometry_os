; DESCRIPTION: Draws a yellow rectangle at (409, 111) with width 57 and height 95.
; PLAN: r0=409(x), r1=111(y), r2=57(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 111
LDI r2, 57
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
