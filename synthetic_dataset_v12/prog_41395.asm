; DESCRIPTION: Creates a blue rectangular region at (315, 36) spanning 102 by 120 pixels.
; PLAN: r0=315(x), r1=36(y), r2=102(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 36
LDI r2, 102
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
