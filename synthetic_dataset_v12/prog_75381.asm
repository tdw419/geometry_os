; DESCRIPTION: Creates a red rectangular region at (179, 114) spanning 77 by 24 pixels.
; PLAN: r0=179(x), r1=114(y), r2=77(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 114
LDI r2, 77
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
