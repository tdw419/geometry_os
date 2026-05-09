; DESCRIPTION: Creates a purple rectangular region at (286, 38) spanning 107 by 79 pixels.
; PLAN: r0=286(x), r1=38(y), r2=107(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 38
LDI r2, 107
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
