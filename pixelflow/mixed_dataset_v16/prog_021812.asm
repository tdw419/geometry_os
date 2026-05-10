; DESCRIPTION: Draws a green rectangle at (398, 2) with width 12 and height 103.
; PLAN: r0=398(x), r1=2(y), r2=12(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 2
LDI r2, 12
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
