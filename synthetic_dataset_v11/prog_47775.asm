; DESCRIPTION: Creates a purple rectangular region at (182, 0) spanning 16 by 85 pixels.
; PLAN: r0=182(x), r1=0(y), r2=16(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 0
LDI r2, 16
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
