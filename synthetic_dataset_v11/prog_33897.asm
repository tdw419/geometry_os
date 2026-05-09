; DESCRIPTION: Creates a yellow rectangular region at (36, 20) spanning 61 by 112 pixels.
; PLAN: r0=36(x), r1=20(y), r2=61(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 20
LDI r2, 61
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
