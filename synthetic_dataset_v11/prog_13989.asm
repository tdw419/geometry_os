; DESCRIPTION: Renders a orange box of size 65x46 starting at (54, 178).
; PLAN: r0=54(x), r1=178(y), r2=65(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 178
LDI r2, 65
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
