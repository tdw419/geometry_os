; DESCRIPTION: Creates a white rectangular region at (402, 150) spanning 99 by 44 pixels.
; PLAN: r0=402(x), r1=150(y), r2=99(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 150
LDI r2, 99
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
