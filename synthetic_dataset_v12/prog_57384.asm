; DESCRIPTION: Creates a red rectangular region at (109, 106) spanning 60 by 24 pixels.
; PLAN: r0=109(x), r1=106(y), r2=60(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 106
LDI r2, 60
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
