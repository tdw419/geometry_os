; DESCRIPTION: Creates a purple rectangular region at (18, 194) spanning 61 by 60 pixels.
; PLAN: r0=18(x), r1=194(y), r2=61(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 194
LDI r2, 61
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
