; DESCRIPTION: Creates a purple rectangular region at (217, 20) spanning 61 by 93 pixels.
; PLAN: r0=217(x), r1=20(y), r2=61(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 20
LDI r2, 61
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
