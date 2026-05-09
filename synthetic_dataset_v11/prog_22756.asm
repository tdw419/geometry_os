; DESCRIPTION: Renders a white box of size 88x105 starting at (42, 91).
; PLAN: r0=42(x), r1=91(y), r2=88(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 91
LDI r2, 88
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
