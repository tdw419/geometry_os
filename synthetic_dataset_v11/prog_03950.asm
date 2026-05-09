; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (75, 29) with width 72 and height 22. Then Draws a blue circle centered at (204, 59) with radius 16.
; PLAN: r0=75(x), r1=29(y), r2=72(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=204(x), r1=59(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (75, 29) with width 72 and height 22.
; PLAN: r0=75(x), r1=29(y), r2=72(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 29
LDI r2, 72
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (204, 59) with radius 16.
; PLAN: r0=204(x), r1=59(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 59
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
