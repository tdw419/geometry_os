; DESCRIPTION: Creates a white rectangular region at (126, 44) spanning 18 by 87 pixels.
; PLAN: r0=126(x), r1=44(y), r2=18(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 44
LDI r2, 18
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
