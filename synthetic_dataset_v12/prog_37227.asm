; DESCRIPTION: Draws a purple rectangle at (398, 117) with width 59 and height 40.
; PLAN: r0=398(x), r1=117(y), r2=59(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 117
LDI r2, 59
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
