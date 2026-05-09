; DESCRIPTION: Creates a purple rectangular region at (267, 41) spanning 12 by 41 pixels.
; PLAN: r0=267(x), r1=41(y), r2=12(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 41
LDI r2, 12
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
