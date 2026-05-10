; DESCRIPTION: Renders a purple rectangular region spanning 22 by 42 at (307, 183).
; PLAN: r0=307(x), r1=183(y), r2=22(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 183
LDI r2, 22
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
