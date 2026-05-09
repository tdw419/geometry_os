; DESCRIPTION: Composite: . Then Renders a white box of size 41x49 starting at (203, 136). Then Places a orange dot at position (67, 241).
; PLAN: r0=203(x), r1=136(y), r2=41(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=67(x), r1=241(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 41x49 starting at (203, 136).
; PLAN: r0=203(x), r1=136(y), r2=41(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 136
LDI r2, 41
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (67, 241).
; PLAN: r0=67(x), r1=241(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 241
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
