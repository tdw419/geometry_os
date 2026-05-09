; DESCRIPTION: Creates a red rectangular region at (223, 44) spanning 29 by 92 pixels.
; PLAN: r0=223(x), r1=44(y), r2=29(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 44
LDI r2, 29
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
