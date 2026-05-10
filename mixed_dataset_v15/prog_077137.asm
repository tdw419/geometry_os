; DESCRIPTION: Creates a yellow rectangular region at (267, 72) spanning 61 by 115 pixels.
; PLAN: r0=267(x), r1=72(y), r2=61(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 72
LDI r2, 61
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
