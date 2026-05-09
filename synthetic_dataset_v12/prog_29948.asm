; DESCRIPTION: Creates a white rectangular region at (273, 66) spanning 86 by 30 pixels.
; PLAN: r0=273(x), r1=66(y), r2=86(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 66
LDI r2, 86
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
