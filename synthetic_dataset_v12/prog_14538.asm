; DESCRIPTION: Renders a green box of size 69x103 starting at (345, 148).
; PLAN: r0=345(x), r1=148(y), r2=69(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 148
LDI r2, 69
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
