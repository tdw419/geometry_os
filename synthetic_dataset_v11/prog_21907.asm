; DESCRIPTION: Creates a cyan rectangular region at (126, 30) spanning 61 by 78 pixels.
; PLAN: r0=126(x), r1=30(y), r2=61(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 30
LDI r2, 61
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
