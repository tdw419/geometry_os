; DESCRIPTION: Creates a purple rectangular region at (309, 59) spanning 64 by 81 pixels.
; PLAN: r0=309(x), r1=59(y), r2=64(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 59
LDI r2, 64
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
