; DESCRIPTION: Creates a cyan rectangular region at (199, 126) spanning 34 by 60 pixels.
; PLAN: r0=199(x), r1=126(y), r2=34(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 126
LDI r2, 34
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
