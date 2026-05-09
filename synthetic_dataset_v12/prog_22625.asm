; DESCRIPTION: Creates a purple rectangular region at (291, 165) spanning 16 by 13 pixels.
; PLAN: r0=291(x), r1=165(y), r2=16(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 165
LDI r2, 16
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
