; DESCRIPTION: Renders a orange box of size 76x27 starting at (333, 144).
; PLAN: r0=333(x), r1=144(y), r2=76(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 144
LDI r2, 76
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
