; DESCRIPTION: Creates a white rectangular region at (19, 7) spanning 50 by 109 pixels.
; PLAN: r0=19(x), r1=7(y), r2=50(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 7
LDI r2, 50
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
