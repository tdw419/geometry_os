; DESCRIPTION: Renders a orange box of size 24x65 starting at (284, 41).
; PLAN: r0=284(x), r1=41(y), r2=24(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 41
LDI r2, 24
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
