; DESCRIPTION: Creates a purple rectangular region at (267, 177) spanning 53 by 13 pixels.
; PLAN: r0=267(x), r1=177(y), r2=53(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 177
LDI r2, 53
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
