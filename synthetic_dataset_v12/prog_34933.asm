; DESCRIPTION: Creates a red rectangular region at (241, 107) spanning 92 by 15 pixels.
; PLAN: r0=241(x), r1=107(y), r2=92(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 107
LDI r2, 92
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
