; DESCRIPTION: Creates a red rectangular region at (408, 62) spanning 79 by 107 pixels.
; PLAN: r0=408(x), r1=62(y), r2=79(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 62
LDI r2, 79
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
