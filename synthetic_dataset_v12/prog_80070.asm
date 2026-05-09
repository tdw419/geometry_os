; DESCRIPTION: Creates a orange rectangular region at (372, 57) spanning 81 by 98 pixels.
; PLAN: r0=372(x), r1=57(y), r2=81(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 57
LDI r2, 81
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
