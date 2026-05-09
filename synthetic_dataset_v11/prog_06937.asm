; DESCRIPTION: Creates a black rectangular region at (154, 1) spanning 99 by 22 pixels.
; PLAN: r0=154(x), r1=1(y), r2=99(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 1
LDI r2, 99
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
