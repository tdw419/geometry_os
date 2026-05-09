; DESCRIPTION: Creates a yellow rectangular region at (156, 19) spanning 10 by 60 pixels.
; PLAN: r0=156(x), r1=19(y), r2=10(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 19
LDI r2, 10
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
