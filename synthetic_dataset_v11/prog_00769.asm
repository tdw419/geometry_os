; DESCRIPTION: Creates a yellow rectangular region at (154, 1) spanning 66 by 77 pixels.
; PLAN: r0=154(x), r1=1(y), r2=66(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 1
LDI r2, 66
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
