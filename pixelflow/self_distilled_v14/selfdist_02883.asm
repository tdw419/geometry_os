; DESCRIPTION: Renders a white rectangular region spanning 103 by 110 at (5, 152).
; PLAN: r0=5(x), r1=152(y), r2=103(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 152
LDI r2, 103
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
