; DESCRIPTION: Renders a orange box of size 85x27 starting at (70, 222).
; PLAN: r0=70(x), r1=222(y), r2=85(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 222
LDI r2, 85
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
