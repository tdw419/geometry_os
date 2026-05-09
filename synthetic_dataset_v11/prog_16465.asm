; DESCRIPTION: Renders a orange box of size 37x78 starting at (187, 24).
; PLAN: r0=187(x), r1=24(y), r2=37(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 24
LDI r2, 37
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
