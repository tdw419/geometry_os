; DESCRIPTION: Creates a purple rectangular region at (258, 17) spanning 77 by 120 pixels.
; PLAN: r0=258(x), r1=17(y), r2=77(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 17
LDI r2, 77
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
