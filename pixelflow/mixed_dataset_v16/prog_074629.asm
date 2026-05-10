; DESCRIPTION: Creates a red rectangular region at (171, 116) spanning 116 by 116 pixels.
; PLAN: r0=171(x), r1=116(y), r2=116(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 116
LDI r2, 116
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
