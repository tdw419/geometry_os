; DESCRIPTION: Creates a black rectangular region at (267, 111) spanning 106 by 32 pixels.
; PLAN: r0=267(x), r1=111(y), r2=106(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 111
LDI r2, 106
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
