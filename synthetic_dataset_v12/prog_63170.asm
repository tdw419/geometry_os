; DESCRIPTION: Creates a white rectangular region at (370, 66) spanning 10 by 13 pixels.
; PLAN: r0=370(x), r1=66(y), r2=10(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 66
LDI r2, 10
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
