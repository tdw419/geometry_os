; DESCRIPTION: Renders a orange box of size 15x17 starting at (465, 129).
; PLAN: r0=465(x), r1=129(y), r2=15(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 129
LDI r2, 15
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
