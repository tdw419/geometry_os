; DESCRIPTION: Creates a white rectangular region at (294, 45) spanning 98 by 78 pixels.
; PLAN: r0=294(x), r1=45(y), r2=98(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 45
LDI r2, 98
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
