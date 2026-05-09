; DESCRIPTION: Creates a yellow rectangular region at (52, 18) spanning 99 by 57 pixels.
; PLAN: r0=52(x), r1=18(y), r2=99(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 18
LDI r2, 99
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
