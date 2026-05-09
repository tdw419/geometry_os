; DESCRIPTION: Renders a white box of size 54x41 starting at (9, 135).
; PLAN: r0=9(x), r1=135(y), r2=54(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 135
LDI r2, 54
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
