; DESCRIPTION: Renders a orange box of size 117x120 starting at (71, 18).
; PLAN: r0=71(x), r1=18(y), r2=117(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 18
LDI r2, 117
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
