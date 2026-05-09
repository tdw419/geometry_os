; DESCRIPTION: Creates a cyan rectangular region at (37, 30) spanning 55 by 81 pixels.
; PLAN: r0=37(x), r1=30(y), r2=55(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 30
LDI r2, 55
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
