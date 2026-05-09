; DESCRIPTION: Creates a yellow rectangular region at (246, 170) spanning 42 by 79 pixels.
; PLAN: r0=246(x), r1=170(y), r2=42(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 170
LDI r2, 42
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
