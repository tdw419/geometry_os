; DESCRIPTION: Renders a orange box of size 28x76 starting at (176, 12).
; PLAN: r0=176(x), r1=12(y), r2=28(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 12
LDI r2, 28
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
