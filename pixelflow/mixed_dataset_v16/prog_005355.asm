; DESCRIPTION: Renders a orange box of size 22x60 starting at (302, 129).
; PLAN: r0=302(x), r1=129(y), r2=22(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 129
LDI r2, 22
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
