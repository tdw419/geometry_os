; DESCRIPTION: Creates a black rectangular region at (154, 156) spanning 51 by 56 pixels.
; PLAN: r0=154(x), r1=156(y), r2=51(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 156
LDI r2, 51
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
