; DESCRIPTION: Creates a red rectangular region at (71, 84) spanning 57 by 107 pixels.
; PLAN: r0=71(x), r1=84(y), r2=57(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 84
LDI r2, 57
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
