; DESCRIPTION: Creates a black rectangular region at (285, 81) spanning 109 by 79 pixels.
; PLAN: r0=285(x), r1=81(y), r2=109(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 81
LDI r2, 109
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
