; DESCRIPTION: Creates a yellow rectangular region at (138, 148) spanning 16 by 59 pixels.
; PLAN: r0=138(x), r1=148(y), r2=16(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 148
LDI r2, 16
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
