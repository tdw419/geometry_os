; DESCRIPTION: Creates a yellow rectangular region at (23, 39) spanning 59 by 90 pixels.
; PLAN: r0=23(x), r1=39(y), r2=59(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 39
LDI r2, 59
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
