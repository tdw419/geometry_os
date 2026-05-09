; DESCRIPTION: Renders a orange box of size 14x23 starting at (21, 44).
; PLAN: r0=21(x), r1=44(y), r2=14(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 44
LDI r2, 14
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
