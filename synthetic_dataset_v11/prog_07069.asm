; DESCRIPTION: Creates a cyan rectangular region at (30, 157) spanning 56 by 92 pixels.
; PLAN: r0=30(x), r1=157(y), r2=56(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 157
LDI r2, 56
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
