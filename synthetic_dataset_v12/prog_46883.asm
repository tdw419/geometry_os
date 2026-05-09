; DESCRIPTION: Creates a yellow rectangular region at (226, 92) spanning 120 by 108 pixels.
; PLAN: r0=226(x), r1=92(y), r2=120(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 92
LDI r2, 120
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
