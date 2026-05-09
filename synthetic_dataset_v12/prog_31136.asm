; DESCRIPTION: Creates a purple rectangular region at (354, 131) spanning 77 by 75 pixels.
; PLAN: r0=354(x), r1=131(y), r2=77(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 131
LDI r2, 77
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
