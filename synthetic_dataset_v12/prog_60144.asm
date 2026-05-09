; DESCRIPTION: Renders a orange box of size 12x11 starting at (70, 244).
; PLAN: r0=70(x), r1=244(y), r2=12(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 244
LDI r2, 12
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
