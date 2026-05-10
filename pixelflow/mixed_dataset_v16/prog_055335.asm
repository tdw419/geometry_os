; DESCRIPTION: Creates a white rectangular region at (337, 126) spanning 61 by 94 pixels.
; PLAN: r0=337(x), r1=126(y), r2=61(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 126
LDI r2, 61
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
