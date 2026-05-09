; DESCRIPTION: Creates a cyan rectangular region at (199, 4) spanning 42 by 88 pixels.
; PLAN: r0=199(x), r1=4(y), r2=42(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 4
LDI r2, 42
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
