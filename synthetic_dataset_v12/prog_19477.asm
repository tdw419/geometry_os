; DESCRIPTION: Creates a yellow rectangular region at (394, 92) spanning 51 by 116 pixels.
; PLAN: r0=394(x), r1=92(y), r2=51(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 92
LDI r2, 51
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
