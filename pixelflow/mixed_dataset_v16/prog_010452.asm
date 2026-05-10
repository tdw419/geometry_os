; DESCRIPTION: Renders a white box of size 62x101 starting at (282, 146).
; PLAN: r0=282(x), r1=146(y), r2=62(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 146
LDI r2, 62
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
