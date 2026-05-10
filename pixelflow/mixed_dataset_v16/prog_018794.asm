; DESCRIPTION: Renders a green box of size 16x71 starting at (69, 148).
; PLAN: r0=69(x), r1=148(y), r2=16(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 148
LDI r2, 16
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
