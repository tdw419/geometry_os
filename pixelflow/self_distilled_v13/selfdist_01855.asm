; DESCRIPTION: Draws a green rectangle at (398, 48) with width 14 and height 46.
; PLAN: r0=398(x), r1=48(y), r2=14(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 48
LDI r2, 14
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
