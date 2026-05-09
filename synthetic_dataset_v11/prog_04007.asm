; DESCRIPTION: Creates a red rectangular region at (124, 37) spanning 56 by 11 pixels.
; PLAN: r0=124(x), r1=37(y), r2=56(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 37
LDI r2, 56
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
