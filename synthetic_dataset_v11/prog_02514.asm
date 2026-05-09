; DESCRIPTION: Renders a green box of size 88x50 starting at (109, 189).
; PLAN: r0=109(x), r1=189(y), r2=88(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 189
LDI r2, 88
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
