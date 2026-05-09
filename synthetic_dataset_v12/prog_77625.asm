; DESCRIPTION: Renders a orange box of size 41x74 starting at (418, 173).
; PLAN: r0=418(x), r1=173(y), r2=41(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 173
LDI r2, 41
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
