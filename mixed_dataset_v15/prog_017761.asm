; DESCRIPTION: Creates a white rectangular region at (341, 117) spanning 112 by 109 pixels.
; PLAN: r0=341(x), r1=117(y), r2=112(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 117
LDI r2, 112
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
