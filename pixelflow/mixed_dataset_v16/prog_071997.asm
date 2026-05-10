; DESCRIPTION: Renders a orange box of size 16x86 starting at (309, 162).
; PLAN: r0=309(x), r1=162(y), r2=16(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 162
LDI r2, 16
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
