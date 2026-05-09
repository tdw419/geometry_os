; DESCRIPTION: Renders a white box of size 60x105 starting at (16, 62).
; PLAN: r0=16(x), r1=62(y), r2=60(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 62
LDI r2, 60
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
