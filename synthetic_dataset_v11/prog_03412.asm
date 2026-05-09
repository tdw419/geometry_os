; DESCRIPTION: Creates a blue rectangular region at (30, 102) spanning 120 by 90 pixels.
; PLAN: r0=30(x), r1=102(y), r2=120(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 102
LDI r2, 120
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
