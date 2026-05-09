; DESCRIPTION: Creates a cyan rectangular region at (66, 68) spanning 92 by 20 pixels.
; PLAN: r0=66(x), r1=68(y), r2=92(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 68
LDI r2, 92
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
