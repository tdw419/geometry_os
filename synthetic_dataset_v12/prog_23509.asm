; DESCRIPTION: Renders a orange box of size 41x18 starting at (300, 92).
; PLAN: r0=300(x), r1=92(y), r2=41(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 92
LDI r2, 41
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
