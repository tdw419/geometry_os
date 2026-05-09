; DESCRIPTION: Renders a orange box of size 76x71 starting at (187, 40).
; PLAN: r0=187(x), r1=40(y), r2=76(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 40
LDI r2, 76
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
