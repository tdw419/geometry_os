; DESCRIPTION: Creates a yellow rectangular region at (154, 156) spanning 29 by 20 pixels.
; PLAN: r0=154(x), r1=156(y), r2=29(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 156
LDI r2, 29
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
