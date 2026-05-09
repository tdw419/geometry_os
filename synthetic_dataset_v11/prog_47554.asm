; DESCRIPTION: Creates a yellow rectangular region at (115, 72) spanning 98 by 59 pixels.
; PLAN: r0=115(x), r1=72(y), r2=98(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 72
LDI r2, 98
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
