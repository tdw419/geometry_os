; DESCRIPTION: Creates a red rectangular region at (289, 121) spanning 30 by 27 pixels.
; PLAN: r0=289(x), r1=121(y), r2=30(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 121
LDI r2, 30
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
