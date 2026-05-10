; DESCRIPTION: Creates a purple rectangular region at (62, 30) spanning 120 by 54 pixels.
; PLAN: r0=62(x), r1=30(y), r2=120(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 30
LDI r2, 120
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
