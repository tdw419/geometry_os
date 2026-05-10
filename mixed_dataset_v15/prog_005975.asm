; DESCRIPTION: Renders a orange box of size 41x24 starting at (387, 12).
; PLAN: r0=387(x), r1=12(y), r2=41(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 12
LDI r2, 41
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
