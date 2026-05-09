; DESCRIPTION: Creates a orange rectangular region at (418, 196) spanning 73 by 57 pixels.
; PLAN: r0=418(x), r1=196(y), r2=73(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 196
LDI r2, 73
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
