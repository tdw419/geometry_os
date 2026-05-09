; DESCRIPTION: Renders a orange box of size 112x46 starting at (58, 21).
; PLAN: r0=58(x), r1=21(y), r2=112(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 21
LDI r2, 112
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
