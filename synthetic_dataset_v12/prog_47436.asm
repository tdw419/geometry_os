; DESCRIPTION: Creates a red rectangular region at (141, 102) spanning 86 by 59 pixels.
; PLAN: r0=141(x), r1=102(y), r2=86(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 102
LDI r2, 86
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
