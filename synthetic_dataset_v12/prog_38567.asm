; DESCRIPTION: Creates a yellow rectangular region at (467, 87) spanning 18 by 43 pixels.
; PLAN: r0=467(x), r1=87(y), r2=18(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 87
LDI r2, 18
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
