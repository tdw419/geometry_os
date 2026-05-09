; DESCRIPTION: Creates a red rectangular region at (367, 212) spanning 71 by 34 pixels.
; PLAN: r0=367(x), r1=212(y), r2=71(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 212
LDI r2, 71
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
