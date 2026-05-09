; DESCRIPTION: Draws a blue rectangle at (406, 159) with width 103 and height 95.
; PLAN: r0=406(x), r1=159(y), r2=103(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 159
LDI r2, 103
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
