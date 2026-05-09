; DESCRIPTION: Renders a blue box of size 14x82 starting at (156, 76).
; PLAN: r0=156(x), r1=76(y), r2=14(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 76
LDI r2, 14
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
