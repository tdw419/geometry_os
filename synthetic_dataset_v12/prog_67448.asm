; DESCRIPTION: Creates a white rectangular region at (11, 187) spanning 64 by 22 pixels.
; PLAN: r0=11(x), r1=187(y), r2=64(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 187
LDI r2, 64
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
