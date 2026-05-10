; DESCRIPTION: Creates a yellow rectangular region at (394, 138) spanning 28 by 30 pixels.
; PLAN: r0=394(x), r1=138(y), r2=28(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 138
LDI r2, 28
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
