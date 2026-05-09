; DESCRIPTION: Creates a orange rectangular region at (326, 36) spanning 81 by 107 pixels.
; PLAN: r0=326(x), r1=36(y), r2=81(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 36
LDI r2, 81
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
