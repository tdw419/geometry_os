; DESCRIPTION: Creates a white rectangular region at (135, 150) spanning 110 by 30 pixels.
; PLAN: r0=135(x), r1=150(y), r2=110(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 150
LDI r2, 110
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
