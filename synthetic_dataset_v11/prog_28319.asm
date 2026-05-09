; DESCRIPTION: Renders a orange box of size 70x38 starting at (27, 55).
; PLAN: r0=27(x), r1=55(y), r2=70(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 55
LDI r2, 70
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
