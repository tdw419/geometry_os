; DESCRIPTION: Creates a yellow rectangular region at (99, 151) spanning 50 by 100 pixels.
; PLAN: r0=99(x), r1=151(y), r2=50(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 151
LDI r2, 50
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
