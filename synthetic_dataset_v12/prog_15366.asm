; DESCRIPTION: Renders a yellow box of size 101x66 starting at (134, 154).
; PLAN: r0=134(x), r1=154(y), r2=101(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 154
LDI r2, 101
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
