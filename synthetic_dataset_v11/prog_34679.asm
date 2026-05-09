; DESCRIPTION: Renders a orange box of size 27x38 starting at (115, 157).
; PLAN: r0=115(x), r1=157(y), r2=27(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 157
LDI r2, 27
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
