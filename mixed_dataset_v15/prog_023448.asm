; DESCRIPTION: Creates a red rectangular region at (233, 69) spanning 71 by 48 pixels.
; PLAN: r0=233(x), r1=69(y), r2=71(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 69
LDI r2, 71
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
