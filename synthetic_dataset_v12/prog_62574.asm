; DESCRIPTION: Creates a yellow rectangular region at (109, 75) spanning 18 by 82 pixels.
; PLAN: r0=109(x), r1=75(y), r2=18(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 75
LDI r2, 18
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
