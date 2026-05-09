; DESCRIPTION: Creates a cyan rectangular region at (199, 110) spanning 11 by 61 pixels.
; PLAN: r0=199(x), r1=110(y), r2=11(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 110
LDI r2, 11
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
