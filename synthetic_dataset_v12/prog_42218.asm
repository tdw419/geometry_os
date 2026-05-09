; DESCRIPTION: Creates a red rectangular region at (218, 29) spanning 57 by 71 pixels.
; PLAN: r0=218(x), r1=29(y), r2=57(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 29
LDI r2, 57
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
