; DESCRIPTION: Creates a purple rectangular region at (109, 124) spanning 77 by 13 pixels.
; PLAN: r0=109(x), r1=124(y), r2=77(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 124
LDI r2, 77
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
