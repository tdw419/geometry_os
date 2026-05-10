; DESCRIPTION: Creates a white rectangular region at (455, 100) spanning 20 by 50 pixels.
; PLAN: r0=455(x), r1=100(y), r2=20(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 100
LDI r2, 20
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
