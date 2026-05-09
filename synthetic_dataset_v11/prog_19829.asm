; DESCRIPTION: Composite: . Then Places a white circle of radius 12 at center (203, 173). Then Renders a red box of size 33x41 starting at (205, 193).
; PLAN: r0=203(x), r1=173(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=205(x), r1=193(y), r2=33(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 12 at center (203, 173).
; PLAN: r0=203(x), r1=173(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 173
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red box of size 33x41 starting at (205, 193).
; PLAN: r0=205(x), r1=193(y), r2=33(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 193
LDI r2, 33
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
