; DESCRIPTION: Creates a white rectangular region at (126, 202) spanning 110 by 48 pixels.
; PLAN: r0=126(x), r1=202(y), r2=110(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 202
LDI r2, 110
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
