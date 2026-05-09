; DESCRIPTION: Creates a yellow rectangular region at (285, 134) spanning 45 by 61 pixels.
; PLAN: r0=285(x), r1=134(y), r2=45(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 134
LDI r2, 45
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
