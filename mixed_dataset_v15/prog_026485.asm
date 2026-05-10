; DESCRIPTION: Creates a white rectangular region at (267, 127) spanning 32 by 19 pixels.
; PLAN: r0=267(x), r1=127(y), r2=32(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 127
LDI r2, 32
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
