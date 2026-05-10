; DESCRIPTION: Renders a yellow rectangular region spanning 97 by 56 at (142, 61).
; PLAN: r0=142(x), r1=61(y), r2=97(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 61
LDI r2, 97
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
