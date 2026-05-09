; DESCRIPTION: Creates a black rectangular region at (274, 30) spanning 120 by 63 pixels.
; PLAN: r0=274(x), r1=30(y), r2=120(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 30
LDI r2, 120
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
