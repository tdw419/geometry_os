; DESCRIPTION: Creates a blue rectangular region at (42, 100) spanning 114 by 107 pixels.
; PLAN: r0=42(x), r1=100(y), r2=114(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 100
LDI r2, 114
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
