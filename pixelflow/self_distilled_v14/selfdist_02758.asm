; DESCRIPTION: Creates a purple filled rectangle of size 26x52 starting at (346, 44).
; PLAN: r0=346(x), r1=44(y), r2=26(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 44
LDI r2, 26
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
