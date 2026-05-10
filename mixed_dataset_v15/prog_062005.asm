; DESCRIPTION: Creates a red rectangular region at (355, 24) spanning 61 by 60 pixels.
; PLAN: r0=355(x), r1=24(y), r2=61(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 24
LDI r2, 61
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
