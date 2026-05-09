; DESCRIPTION: Composite: . Then Renders a orange box of size 25x37 starting at (49, 47). Then Places a red circle of radius 22 at center (38, 41).
; PLAN: r0=49(x), r1=47(y), r2=25(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=38(x), r1=41(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a orange box of size 25x37 starting at (49, 47).
; PLAN: r0=49(x), r1=47(y), r2=25(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 47
LDI r2, 25
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 22 at center (38, 41).
; PLAN: r0=38(x), r1=41(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 41
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
