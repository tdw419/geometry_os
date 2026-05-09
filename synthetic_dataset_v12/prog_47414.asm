; DESCRIPTION: Creates a red rectangular region at (201, 124) spanning 100 by 38 pixels.
; PLAN: r0=201(x), r1=124(y), r2=100(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 124
LDI r2, 100
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
