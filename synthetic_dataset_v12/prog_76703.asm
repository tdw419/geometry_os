; DESCRIPTION: Creates a white rectangular region at (331, 160) spanning 82 by 45 pixels.
; PLAN: r0=331(x), r1=160(y), r2=82(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 160
LDI r2, 82
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
