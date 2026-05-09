; DESCRIPTION: Creates a purple rectangular region at (460, 44) spanning 32 by 71 pixels.
; PLAN: r0=460(x), r1=44(y), r2=32(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 44
LDI r2, 32
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
