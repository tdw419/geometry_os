; DESCRIPTION: Creates a green rectangular region at (90, 134) spanning 114 by 61 pixels.
; PLAN: r0=90(x), r1=134(y), r2=114(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 134
LDI r2, 114
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
