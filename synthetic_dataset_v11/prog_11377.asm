; DESCRIPTION: Creates a orange rectangular region at (199, 237) spanning 54 by 16 pixels.
; PLAN: r0=199(x), r1=237(y), r2=54(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 237
LDI r2, 54
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
