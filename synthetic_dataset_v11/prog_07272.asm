; DESCRIPTION: Creates a black rectangular region at (154, 170) spanning 47 by 27 pixels.
; PLAN: r0=154(x), r1=170(y), r2=47(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 170
LDI r2, 47
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
