; DESCRIPTION: Renders a purple box of size 42x95 starting at (351, 36).
; PLAN: r0=351(x), r1=36(y), r2=42(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 36
LDI r2, 42
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
