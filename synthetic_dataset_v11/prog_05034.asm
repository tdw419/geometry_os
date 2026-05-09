; DESCRIPTION: Renders a white box of size 91x68 starting at (12, 101).
; PLAN: r0=12(x), r1=101(y), r2=91(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 101
LDI r2, 91
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
