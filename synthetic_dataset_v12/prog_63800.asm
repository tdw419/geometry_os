; DESCRIPTION: Creates a yellow rectangular region at (452, 48) spanning 55 by 107 pixels.
; PLAN: r0=452(x), r1=48(y), r2=55(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 48
LDI r2, 55
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
