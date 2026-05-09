; DESCRIPTION: Creates a cyan rectangular region at (118, 11) spanning 61 by 56 pixels.
; PLAN: r0=118(x), r1=11(y), r2=61(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 11
LDI r2, 61
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
