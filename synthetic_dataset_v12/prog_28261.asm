; DESCRIPTION: Creates a red rectangular region at (114, 131) spanning 58 by 55 pixels.
; PLAN: r0=114(x), r1=131(y), r2=58(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 131
LDI r2, 58
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
