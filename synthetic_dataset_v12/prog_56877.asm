; DESCRIPTION: Creates a red rectangular region at (340, 7) spanning 73 by 116 pixels.
; PLAN: r0=340(x), r1=7(y), r2=73(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 7
LDI r2, 73
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
