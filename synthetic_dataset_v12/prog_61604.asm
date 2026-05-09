; DESCRIPTION: Creates a cyan rectangular region at (177, 12) spanning 22 by 33 pixels.
; PLAN: r0=177(x), r1=12(y), r2=22(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 12
LDI r2, 22
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
