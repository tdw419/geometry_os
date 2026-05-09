; DESCRIPTION: Renders a yellow box of size 84x56 starting at (373, 97).
; PLAN: r0=373(x), r1=97(y), r2=84(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 97
LDI r2, 84
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
