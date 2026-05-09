; DESCRIPTION: Creates a cyan rectangular region at (10, 8) spanning 49 by 66 pixels.
; PLAN: r0=10(x), r1=8(y), r2=49(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 8
LDI r2, 49
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
