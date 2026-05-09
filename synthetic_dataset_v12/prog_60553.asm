; DESCRIPTION: Creates a white rectangular region at (453, 50) spanning 18 by 75 pixels.
; PLAN: r0=453(x), r1=50(y), r2=18(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 50
LDI r2, 18
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
