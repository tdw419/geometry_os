; DESCRIPTION: Draws a green rectangle at (284, 5) with width 57 and height 84.
; PLAN: r0=284(x), r1=5(y), r2=57(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 5
LDI r2, 57
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
