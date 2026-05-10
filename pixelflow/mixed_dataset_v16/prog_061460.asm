; DESCRIPTION: Creates a purple rectangular region at (251, 120) spanning 37 by 39 pixels.
; PLAN: r0=251(x), r1=120(y), r2=37(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 120
LDI r2, 37
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
