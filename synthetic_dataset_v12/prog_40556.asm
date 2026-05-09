; DESCRIPTION: Creates a purple rectangular region at (367, 16) spanning 61 by 11 pixels.
; PLAN: r0=367(x), r1=16(y), r2=61(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 16
LDI r2, 61
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
