; DESCRIPTION: Renders a white box of size 42x29 starting at (195, 30).
; PLAN: r0=195(x), r1=30(y), r2=42(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 30
LDI r2, 42
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
