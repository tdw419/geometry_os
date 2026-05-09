; DESCRIPTION: Creates a yellow rectangular region at (388, 99) spanning 67 by 27 pixels.
; PLAN: r0=388(x), r1=99(y), r2=67(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 99
LDI r2, 67
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
