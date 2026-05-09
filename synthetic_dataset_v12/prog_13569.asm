; DESCRIPTION: Creates a red rectangular region at (408, 134) spanning 23 by 114 pixels.
; PLAN: r0=408(x), r1=134(y), r2=23(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 134
LDI r2, 23
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
