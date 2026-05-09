; DESCRIPTION: Creates a black rectangular region at (297, 120) spanning 115 by 72 pixels.
; PLAN: r0=297(x), r1=120(y), r2=115(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 120
LDI r2, 115
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
