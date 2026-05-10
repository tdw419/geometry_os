; DESCRIPTION: Renders a white box of size 60x93 starting at (49, 156).
; PLAN: r0=49(x), r1=156(y), r2=60(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 156
LDI r2, 60
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
