; DESCRIPTION: Creates a cyan rectangular region at (249, 75) spanning 38 by 92 pixels.
; PLAN: r0=249(x), r1=75(y), r2=38(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 75
LDI r2, 38
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
