; DESCRIPTION: Creates a purple rectangular region at (73, 245) spanning 113 by 10 pixels.
; PLAN: r0=73(x), r1=245(y), r2=113(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 245
LDI r2, 113
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
