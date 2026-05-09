; DESCRIPTION: Creates a yellow rectangular region at (10, 181) spanning 86 by 54 pixels.
; PLAN: r0=10(x), r1=181(y), r2=86(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 181
LDI r2, 86
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
