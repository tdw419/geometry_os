; DESCRIPTION: Creates a purple rectangular region at (262, 85) spanning 13 by 98 pixels.
; PLAN: r0=262(x), r1=85(y), r2=13(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 85
LDI r2, 13
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
