; DESCRIPTION: Composite: . Then Renders a white disk with center (121, 72) and radius 54. Then Renders a orange box of size 88x55 starting at (34, 103).
; PLAN: r0=121(x), r1=72(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=34(x), r1=103(y), r2=88(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (121, 72) and radius 54.
; PLAN: r0=121(x), r1=72(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 72
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange box of size 88x55 starting at (34, 103).
; PLAN: r0=34(x), r1=103(y), r2=88(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 103
LDI r2, 88
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
