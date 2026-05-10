; DESCRIPTION: Creates a purple rectangular region at (460, 1) spanning 50 by 102 pixels.
; PLAN: r0=460(x), r1=1(y), r2=50(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 1
LDI r2, 50
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
