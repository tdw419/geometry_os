; DESCRIPTION: Creates a yellow rectangular region at (54, 120) spanning 101 by 56 pixels.
; PLAN: r0=54(x), r1=120(y), r2=101(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 120
LDI r2, 101
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
