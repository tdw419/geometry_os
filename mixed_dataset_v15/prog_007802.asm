; DESCRIPTION: Renders a yellow rectangular region spanning 82 by 42 at (8, 183).
; PLAN: r0=8(x), r1=183(y), r2=82(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 183
LDI r2, 82
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
