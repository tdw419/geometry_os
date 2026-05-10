; DESCRIPTION: Renders a purple rectangular region spanning 42 by 24 at (32, 190).
; PLAN: r0=32(x), r1=190(y), r2=42(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 190
LDI r2, 42
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
