; DESCRIPTION: Creates a black rectangular region at (337, 179) spanning 61 by 12 pixels.
; PLAN: r0=337(x), r1=179(y), r2=61(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 179
LDI r2, 61
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
