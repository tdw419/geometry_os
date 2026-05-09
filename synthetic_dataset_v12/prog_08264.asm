; DESCRIPTION: Renders a orange box of size 95x73 starting at (40, 49).
; PLAN: r0=40(x), r1=49(y), r2=95(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 49
LDI r2, 95
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
