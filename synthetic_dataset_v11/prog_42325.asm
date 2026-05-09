; DESCRIPTION: Creates a cyan rectangular region at (140, 136) spanning 96 by 34 pixels.
; PLAN: r0=140(x), r1=136(y), r2=96(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 136
LDI r2, 96
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
