; DESCRIPTION: Renders a orange box of size 102x73 starting at (148, 166).
; PLAN: r0=148(x), r1=166(y), r2=102(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 166
LDI r2, 102
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
