; DESCRIPTION: Creates a white rectangular region at (126, 5) spanning 44 by 49 pixels.
; PLAN: r0=126(x), r1=5(y), r2=44(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 5
LDI r2, 44
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
