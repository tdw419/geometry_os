; DESCRIPTION: Renders a orange box of size 13x28 starting at (187, 52).
; PLAN: r0=187(x), r1=52(y), r2=13(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 52
LDI r2, 13
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
