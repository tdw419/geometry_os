; DESCRIPTION: Creates a white rectangular region at (52, 160) spanning 101 by 45 pixels.
; PLAN: r0=52(x), r1=160(y), r2=101(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 160
LDI r2, 101
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
