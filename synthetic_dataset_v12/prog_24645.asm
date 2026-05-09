; DESCRIPTION: Creates a red rectangular region at (177, 157) spanning 108 by 73 pixels.
; PLAN: r0=177(x), r1=157(y), r2=108(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 157
LDI r2, 108
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
