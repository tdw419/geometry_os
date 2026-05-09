; DESCRIPTION: Renders a orange box of size 48x33 starting at (14, 170).
; PLAN: r0=14(x), r1=170(y), r2=48(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 170
LDI r2, 48
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
