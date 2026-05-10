; DESCRIPTION: Creates a green filled rectangle of size 103x101 starting at (78, 154).
; PLAN: r0=78(x), r1=154(y), r2=103(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 154
LDI r2, 103
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
