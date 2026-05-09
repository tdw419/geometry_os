; DESCRIPTION: Renders a green box of size 25x69 starting at (154, 69).
; PLAN: r0=154(x), r1=69(y), r2=25(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 69
LDI r2, 25
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
