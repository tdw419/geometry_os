; DESCRIPTION: Creates a white rectangular region at (66, 10) spanning 45 by 74 pixels.
; PLAN: r0=66(x), r1=10(y), r2=45(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 10
LDI r2, 45
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
