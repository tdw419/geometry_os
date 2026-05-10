; DESCRIPTION: Renders a purple rectangular region spanning 42 by 12 at (110, 141).
; PLAN: r0=110(x), r1=141(y), r2=42(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 141
LDI r2, 42
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
