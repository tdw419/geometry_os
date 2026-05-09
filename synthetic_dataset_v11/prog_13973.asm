; DESCRIPTION: Creates a purple rectangular region at (92, 114) spanning 70 by 60 pixels.
; PLAN: r0=92(x), r1=114(y), r2=70(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 114
LDI r2, 70
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
