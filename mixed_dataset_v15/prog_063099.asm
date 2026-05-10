; DESCRIPTION: Creates a magenta rectangular region at (259, 201) spanning 98 by 14 pixels.
; PLAN: r0=259(x), r1=201(y), r2=98(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 201
LDI r2, 98
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
