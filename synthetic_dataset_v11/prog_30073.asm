; DESCRIPTION: Creates a white rectangular region at (52, 193) spanning 109 by 49 pixels.
; PLAN: r0=52(x), r1=193(y), r2=109(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 193
LDI r2, 109
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
