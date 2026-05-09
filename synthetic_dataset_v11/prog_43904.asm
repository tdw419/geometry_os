; DESCRIPTION: Renders a orange box of size 41x25 starting at (102, 125).
; PLAN: r0=102(x), r1=125(y), r2=41(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 125
LDI r2, 41
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
