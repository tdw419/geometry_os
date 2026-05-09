; DESCRIPTION: Creates a purple rectangular region at (120, 94) spanning 30 by 90 pixels.
; PLAN: r0=120(x), r1=94(y), r2=30(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 94
LDI r2, 30
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
