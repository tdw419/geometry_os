; DESCRIPTION: Creates a purple rectangular region at (368, 64) spanning 77 by 45 pixels.
; PLAN: r0=368(x), r1=64(y), r2=77(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 64
LDI r2, 77
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
