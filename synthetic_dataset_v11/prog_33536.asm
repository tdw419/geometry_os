; DESCRIPTION: Creates a yellow rectangular region at (30, 30) spanning 10 by 52 pixels.
; PLAN: r0=30(x), r1=30(y), r2=10(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 30
LDI r2, 10
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
