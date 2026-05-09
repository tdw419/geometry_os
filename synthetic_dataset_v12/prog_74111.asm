; DESCRIPTION: Creates a purple rectangular region at (100, 172) spanning 42 by 20 pixels.
; PLAN: r0=100(x), r1=172(y), r2=42(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 172
LDI r2, 42
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
