; DESCRIPTION: Renders a white box of size 86x113 starting at (56, 41).
; PLAN: r0=56(x), r1=41(y), r2=86(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 41
LDI r2, 86
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
