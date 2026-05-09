; DESCRIPTION: Renders a orange box of size 105x27 starting at (128, 14).
; PLAN: r0=128(x), r1=14(y), r2=105(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 14
LDI r2, 105
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
