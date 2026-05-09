; DESCRIPTION: Composite: . Then Creates a white circular shape at (167, 161) with radius 70. Then Renders a orange box of size 92x41 starting at (31, 125).
; PLAN: r0=167(x), r1=161(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=31(x), r1=125(y), r2=92(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white circular shape at (167, 161) with radius 70.
; PLAN: r0=167(x), r1=161(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 161
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange box of size 92x41 starting at (31, 125).
; PLAN: r0=31(x), r1=125(y), r2=92(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 125
LDI r2, 92
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
