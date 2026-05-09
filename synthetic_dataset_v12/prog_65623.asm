; DESCRIPTION: Creates a cyan rectangular region at (36, 139) spanning 81 by 32 pixels.
; PLAN: r0=36(x), r1=139(y), r2=81(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 139
LDI r2, 81
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
