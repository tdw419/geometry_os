; DESCRIPTION: Creates a orange rectangular region at (109, 142) spanning 39 by 94 pixels.
; PLAN: r0=109(x), r1=142(y), r2=39(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 142
LDI r2, 39
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
