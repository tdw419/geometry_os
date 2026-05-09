; DESCRIPTION: Creates a orange rectangular region at (32, 77) spanning 57 by 111 pixels.
; PLAN: r0=32(x), r1=77(y), r2=57(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 77
LDI r2, 57
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
