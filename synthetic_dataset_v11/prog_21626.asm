; DESCRIPTION: Composite: . Then Renders a orange box of size 118x70 starting at (54, 20). Then Draws a yellow circle centered at (181, 135) with radius 19.
; PLAN: r0=54(x), r1=20(y), r2=118(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=181(x), r1=135(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a orange box of size 118x70 starting at (54, 20).
; PLAN: r0=54(x), r1=20(y), r2=118(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 20
LDI r2, 118
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (181, 135) with radius 19.
; PLAN: r0=181(x), r1=135(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 135
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
