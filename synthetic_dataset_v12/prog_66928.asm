; DESCRIPTION: Creates a red rectangular region at (444, 118) spanning 47 by 82 pixels.
; PLAN: r0=444(x), r1=118(y), r2=47(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 118
LDI r2, 47
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
