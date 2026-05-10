; DESCRIPTION: Renders a orange box of size 120x99 starting at (244, 45).
; PLAN: r0=244(x), r1=45(y), r2=120(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 45
LDI r2, 120
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
