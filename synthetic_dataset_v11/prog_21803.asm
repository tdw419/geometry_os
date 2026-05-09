; DESCRIPTION: Creates a yellow rectangular region at (139, 59) spanning 10 by 12 pixels.
; PLAN: r0=139(x), r1=59(y), r2=10(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 59
LDI r2, 10
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
