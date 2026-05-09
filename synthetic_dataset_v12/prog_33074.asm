; DESCRIPTION: Creates a cyan rectangular region at (425, 211) spanning 31 by 16 pixels.
; PLAN: r0=425(x), r1=211(y), r2=31(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 211
LDI r2, 31
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
