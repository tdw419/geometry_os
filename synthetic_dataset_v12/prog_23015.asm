; DESCRIPTION: Creates a red rectangular region at (285, 171) spanning 84 by 83 pixels.
; PLAN: r0=285(x), r1=171(y), r2=84(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 171
LDI r2, 84
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
