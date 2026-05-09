; DESCRIPTION: Creates a yellow rectangular region at (81, 48) spanning 54 by 59 pixels.
; PLAN: r0=81(x), r1=48(y), r2=54(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 48
LDI r2, 54
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
