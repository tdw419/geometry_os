; DESCRIPTION: Renders a orange box of size 54x113 starting at (161, 55).
; PLAN: r0=161(x), r1=55(y), r2=54(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 55
LDI r2, 54
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
