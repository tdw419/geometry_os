; DESCRIPTION: Renders a orange box of size 15x91 starting at (225, 129).
; PLAN: r0=225(x), r1=129(y), r2=15(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 129
LDI r2, 15
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
