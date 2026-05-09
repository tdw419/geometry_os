; DESCRIPTION: Renders a green box of size 54x118 starting at (154, 67).
; PLAN: r0=154(x), r1=67(y), r2=54(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 67
LDI r2, 54
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
