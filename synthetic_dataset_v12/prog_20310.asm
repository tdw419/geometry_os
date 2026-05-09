; DESCRIPTION: Creates a yellow rectangular region at (447, 107) spanning 29 by 24 pixels.
; PLAN: r0=447(x), r1=107(y), r2=29(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 107
LDI r2, 29
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
