; DESCRIPTION: Creates a magenta rectangular region at (171, 201) spanning 31 by 19 pixels.
; PLAN: r0=171(x), r1=201(y), r2=31(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 201
LDI r2, 31
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
