; DESCRIPTION: Creates a orange rectangular region at (413, 17) spanning 74 by 94 pixels.
; PLAN: r0=413(x), r1=17(y), r2=74(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 17
LDI r2, 74
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
