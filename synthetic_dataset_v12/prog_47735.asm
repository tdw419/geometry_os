; DESCRIPTION: Creates a cyan rectangular region at (361, 68) spanning 87 by 24 pixels.
; PLAN: r0=361(x), r1=68(y), r2=87(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 68
LDI r2, 87
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
