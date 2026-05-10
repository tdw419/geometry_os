; DESCRIPTION: Creates a purple rectangular region at (120, 103) spanning 11 by 76 pixels.
; PLAN: r0=120(x), r1=103(y), r2=11(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 103
LDI r2, 11
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
