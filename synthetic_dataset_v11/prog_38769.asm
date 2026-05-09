; DESCRIPTION: Creates a white rectangular region at (36, 96) spanning 96 by 13 pixels.
; PLAN: r0=36(x), r1=96(y), r2=96(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 96
LDI r2, 96
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
