; DESCRIPTION: Creates a yellow rectangular region at (276, 154) spanning 100 by 44 pixels.
; PLAN: r0=276(x), r1=154(y), r2=100(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 154
LDI r2, 100
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
