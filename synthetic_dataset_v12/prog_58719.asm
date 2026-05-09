; DESCRIPTION: Creates a yellow rectangular region at (405, 201) spanning 57 by 20 pixels.
; PLAN: r0=405(x), r1=201(y), r2=57(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 201
LDI r2, 57
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
