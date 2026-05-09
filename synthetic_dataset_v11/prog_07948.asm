; DESCRIPTION: Creates a black rectangular region at (3, 6) spanning 120 by 115 pixels.
; PLAN: r0=3(x), r1=6(y), r2=120(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 6
LDI r2, 120
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
