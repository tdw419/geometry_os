; DESCRIPTION: Renders a orange box of size 16x45 starting at (37, 23).
; PLAN: r0=37(x), r1=23(y), r2=16(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 23
LDI r2, 16
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
