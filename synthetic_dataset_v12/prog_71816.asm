; DESCRIPTION: Creates a black rectangular region at (324, 126) spanning 117 by 77 pixels.
; PLAN: r0=324(x), r1=126(y), r2=117(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 126
LDI r2, 117
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
