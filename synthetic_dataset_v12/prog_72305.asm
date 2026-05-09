; DESCRIPTION: Creates a white rectangular region at (132, 48) spanning 115 by 75 pixels.
; PLAN: r0=132(x), r1=48(y), r2=115(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 48
LDI r2, 115
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
