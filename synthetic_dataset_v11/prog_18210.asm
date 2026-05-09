; DESCRIPTION: Composite: . Then Places a red circle of radius 24 at center (188, 229). Then Renders a orange box of size 104x15 starting at (49, 77).
; PLAN: r0=188(x), r1=229(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=49(x), r1=77(y), r2=104(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 24 at center (188, 229).
; PLAN: r0=188(x), r1=229(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 229
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange box of size 104x15 starting at (49, 77).
; PLAN: r0=49(x), r1=77(y), r2=104(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 77
LDI r2, 104
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
