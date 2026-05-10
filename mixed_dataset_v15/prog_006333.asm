; DESCRIPTION: Creates a black rectangular region at (422, 93) spanning 71 by 100 pixels.
; PLAN: r0=422(x), r1=93(y), r2=71(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 93
LDI r2, 71
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
