; DESCRIPTION: Creates a red rectangular region at (111, 201) spanning 90 by 18 pixels.
; PLAN: r0=111(x), r1=201(y), r2=90(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 201
LDI r2, 90
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
