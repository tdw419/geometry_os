; DESCRIPTION: Renders a green box of size 42x18 starting at (67, 3).
; PLAN: r0=67(x), r1=3(y), r2=42(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 3
LDI r2, 42
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
