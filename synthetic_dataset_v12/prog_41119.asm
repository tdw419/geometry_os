; DESCRIPTION: Creates a yellow rectangular region at (399, 11) spanning 45 by 107 pixels.
; PLAN: r0=399(x), r1=11(y), r2=45(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 11
LDI r2, 45
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
