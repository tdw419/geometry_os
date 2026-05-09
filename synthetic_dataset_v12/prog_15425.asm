; DESCRIPTION: Creates a red rectangular region at (304, 4) spanning 33 by 93 pixels.
; PLAN: r0=304(x), r1=4(y), r2=33(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 4
LDI r2, 33
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
