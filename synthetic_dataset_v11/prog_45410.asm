; DESCRIPTION: Creates a orange rectangular region at (32, 77) spanning 111 by 22 pixels.
; PLAN: r0=32(x), r1=77(y), r2=111(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 77
LDI r2, 111
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
