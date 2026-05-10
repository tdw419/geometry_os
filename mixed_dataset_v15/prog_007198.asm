; DESCRIPTION: Renders a orange box of size 102x98 starting at (71, 14).
; PLAN: r0=71(x), r1=14(y), r2=102(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 14
LDI r2, 102
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
