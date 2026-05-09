; DESCRIPTION: Creates a red rectangular region at (299, 236) spanning 109 by 12 pixels.
; PLAN: r0=299(x), r1=236(y), r2=109(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 236
LDI r2, 109
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
