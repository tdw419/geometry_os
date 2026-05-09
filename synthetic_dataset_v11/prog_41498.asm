; DESCRIPTION: Creates a purple rectangular region at (23, 114) spanning 27 by 61 pixels.
; PLAN: r0=23(x), r1=114(y), r2=27(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 114
LDI r2, 27
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
