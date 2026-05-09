; DESCRIPTION: Renders a orange box of size 27x119 starting at (160, 20).
; PLAN: r0=160(x), r1=20(y), r2=27(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 20
LDI r2, 27
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
