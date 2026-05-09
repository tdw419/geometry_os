; DESCRIPTION: Creates a purple rectangular region at (120, 114) spanning 61 by 58 pixels.
; PLAN: r0=120(x), r1=114(y), r2=61(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 114
LDI r2, 61
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
