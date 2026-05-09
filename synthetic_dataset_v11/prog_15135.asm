; DESCRIPTION: Creates a red rectangular region at (24, 103) spanning 118 by 46 pixels.
; PLAN: r0=24(x), r1=103(y), r2=118(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 103
LDI r2, 118
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
