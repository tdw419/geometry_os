; DESCRIPTION: Renders a green box of size 69x80 starting at (181, 165).
; PLAN: r0=181(x), r1=165(y), r2=69(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 165
LDI r2, 69
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
