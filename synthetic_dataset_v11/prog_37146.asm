; DESCRIPTION: Composite: . Then Draws a orange rectangle at (108, 31) with width 109 and height 101. Then Places a green circle of radius 59 at center (109, 108).
; PLAN: r0=108(x), r1=31(y), r2=109(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=109(x), r1=108(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange rectangle at (108, 31) with width 109 and height 101.
; PLAN: r0=108(x), r1=31(y), r2=109(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 31
LDI r2, 109
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 59 at center (109, 108).
; PLAN: r0=109(x), r1=108(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 108
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
