; DESCRIPTION: Renders a orange box of size 65x103 starting at (17, 147).
; PLAN: r0=17(x), r1=147(y), r2=65(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 147
LDI r2, 65
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
