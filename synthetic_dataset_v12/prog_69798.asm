; DESCRIPTION: Creates a white rectangular region at (66, 16) spanning 18 by 112 pixels.
; PLAN: r0=66(x), r1=16(y), r2=18(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 16
LDI r2, 18
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
