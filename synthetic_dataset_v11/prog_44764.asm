; DESCRIPTION: Composite: . Then Renders a red box of size 100x96 starting at (9, 112). Then Draws a green circle centered at (108, 84) with radius 11.
; PLAN: r0=9(x), r1=112(y), r2=100(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=108(x), r1=84(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red box of size 100x96 starting at (9, 112).
; PLAN: r0=9(x), r1=112(y), r2=100(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 112
LDI r2, 100
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (108, 84) with radius 11.
; PLAN: r0=108(x), r1=84(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 84
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
