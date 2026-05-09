; DESCRIPTION: Creates a white rectangular region at (160, 11) spanning 12 by 93 pixels.
; PLAN: r0=160(x), r1=11(y), r2=12(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 11
LDI r2, 12
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
