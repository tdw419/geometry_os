; DESCRIPTION: Renders a orange box of size 18x103 starting at (65, 141).
; PLAN: r0=65(x), r1=141(y), r2=18(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 141
LDI r2, 18
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
