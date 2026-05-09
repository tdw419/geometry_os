; DESCRIPTION: Renders a purple box of size 87x38 starting at (82, 36).
; PLAN: r0=82(x), r1=36(y), r2=87(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 36
LDI r2, 87
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
