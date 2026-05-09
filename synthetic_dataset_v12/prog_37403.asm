; DESCRIPTION: Creates a red rectangular region at (171, 61) spanning 71 by 77 pixels.
; PLAN: r0=171(x), r1=61(y), r2=71(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 61
LDI r2, 71
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
