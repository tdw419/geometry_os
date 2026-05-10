; DESCRIPTION: Creates a yellow rectangular region at (107, 11) spanning 12 by 27 pixels.
; PLAN: r0=107(x), r1=11(y), r2=12(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 11
LDI r2, 12
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
