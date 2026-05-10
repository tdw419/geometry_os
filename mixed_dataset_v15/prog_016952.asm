; DESCRIPTION: Creates a white rectangular region at (368, 119) spanning 90 by 99 pixels.
; PLAN: r0=368(x), r1=119(y), r2=90(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 119
LDI r2, 90
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
